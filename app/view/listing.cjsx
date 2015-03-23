React = require 'react'
ImageGallery = require 'react-image-gallery'
_ = require 'lodash'

module.exports = React.createClass
  render: ->

    {images} = @props
    items = _.map images, (img) ->
      {cdn} = img
      original: cdn
      thumbnail: cdn

    <div className="container">
      <ImageGallery items={items} />
    </div>
