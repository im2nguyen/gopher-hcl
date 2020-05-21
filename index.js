const build = require('./build')

function parseInput(input) {
  if (Buffer.isBuffer(input)) return new Uint8Array(input)
  if (typeof input === 'string') return new Uint8Array(Buffer.from(input))

  throw new TypeError('Expected input to be a string or buffer')
}

const parse = (input) => {
  const src = parseInput(input)
  const [result, error] = build.parse(src)

  if (error) {
    console.log(error)
    throw Object.assign(new Error('Malformed HCL'), {
      offset: error.Pos.Offset,
      line: error.Pos.Line,
      column: error.Pos.Column
    })
  }

  return result
}

exports.parse = (input) => parse(input)
