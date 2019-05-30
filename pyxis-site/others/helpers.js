const toSlug = str => {
  return str.toLowerCase().split(' ').join('_')
}

export default {
  toSlug
}
