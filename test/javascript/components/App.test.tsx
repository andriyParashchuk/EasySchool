import * as React from 'react'
import { shallow } from 'enzyme'

import { App } from '../../../app/javascript/components/App'

it('Renders component with props', () => {
  const name = "Test"

  const component = shallow(
    <App
      name={name}
    />,
  )

  expect(component).toMatchSnapshot()
  expect(component.matchesElement(<div>Hello Test!</div>)).toBeTruthy()
})
