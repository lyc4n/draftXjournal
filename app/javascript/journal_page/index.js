import React from 'react'
import JournalPageRoot from './components/main'

document.addEventListener('turbolinks:load', () => {
  JournalPageRoot.initialize()
})
