React = require 'react'
{Link} = require 'react-router'
{RouteHandler, State} = require 'react-router'

module.exports = React.createClass
  mixins: [State]
  render: ->
    {sha, description, author, title} = @props
    appFileName = sha or 'app'
    cssFilePath = "/assets/#{appFileName}.css"
    jsFilePath = "/assets/#{appFileName}.js"

    url = @context.router.getCurrentPathname()
    if url is '/' then url = '/homepage'
    urlArray = url.split('/')

    if @props.db[urlArray[1]]
      pageData = @props.db[urlArray[1]]
    else if @props.db['404']
      pageData = @props.db['404']
    else
      pagedata = @props.db

    if author
      metaAuthor = <meta name="author" content={author} />
    else
      metaAuthor = false

    if description
      metaDescription = <meta name="description" content={description} />
    else
      metaDescription = false

    <html>
      <head>
        <title>{title or 'title'}</title>
        <meta charSet="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="stylesheet" type="text/css" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
        <meta name="generator" content="CAPE.io, see www.cape.io" />
        {metaAuthor} {metaDescription}
        <link rel="stylesheet" type="text/css" href={cssFilePath} />
      </head>
      <body>
        {React.createElement(RouteHandler, pageData)}
        <script src={jsFilePath} type="text/javascript" />
      </body>
    </html>
