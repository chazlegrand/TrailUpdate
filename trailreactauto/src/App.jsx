import React, { Component } from 'react';
import getMuiTheme from 'material-ui/styles/getMuiTheme'
import MuiThemeProvider from 'material-ui/styles/MuiThemeProvider'
import TopBar from './components/NavBar/index'
import Welcome from './containers/WelcomePage'
import * as injectTapEventPlugin from 'react-tap-event-plugin';

require('./stylesheets/main.css');

const muiTheme = getMuiTheme(
  {}
)

class App extends Component {
    constructor(props) {
        injectTapEventPlugin();
        super(props);
    }

    state = {
        display: <Welcome/>
    }

  displaySetter = (type) => {
      console.log("I've been called")
        switch(type) {
            // case "hello":
            //     this.setState({
            //       display: <HelloComponent handleClick={this.displaySetter}/>
            //     })
            //     break;

            case "welcome":
                this.setState({
                    display: <Welcome handleClick={this.displaySetter}/>
                })
                break;

            default: this.setState({
                display: <Welcome />
            })
        }
    }


  render() {
    return (
      <MuiThemeProvider muiTheme={muiTheme}>
        <div className="trail-update-wrapper">
          <TopBar handleClick={this.displaySetter}/>
            {this.state.display}
        </div>
      </MuiThemeProvider>
    );
  }
}

export default App;