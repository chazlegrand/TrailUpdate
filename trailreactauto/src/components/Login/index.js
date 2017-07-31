import React, { Component } from 'react';
import RaisedButton from 'material-ui/RaisedButton';

class Login extends Component {
    render() {
        return(
            <div className="login">
                <h1>Hello</h1>
                <RaisedButton onTouchTap={() => this.props.handleClick("welcome")} label="Welcome" />
            </div>
        )
    }
}

export default Login;