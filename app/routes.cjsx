React = require 'react'
{Route, DefaultRoute} = require 'react-router'

Index = require './view/index'

module.exports =

  <Route name="app" path="/" handler={Index}>

  </Route>
