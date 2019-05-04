import * as React from 'react'
import * as ReactDOM from 'react-dom'

interface AppProps {
  name: string,
}

export class App extends React.Component<AppProps> {
  render() {
    const { name } = this.props
    return <div>Hello {name}!</div>
  }
}
