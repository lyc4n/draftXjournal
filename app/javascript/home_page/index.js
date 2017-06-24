import React from 'react'
import HomePageRoot from './components/main'


document.addEventListener('turbolinks:load', () => {
  HomePageRoot.initialize()
})
