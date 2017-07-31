import React, { Component } from 'react';
import Login from '../../components/Login/index'
import RaisedButton from 'material-ui/RaisedButton';

class Welcome extends Component {
    render() {
        return(
            <div className="welcome-page">
                <h1>Welcome</h1>
                <RaisedButton label="Yay2" />
                <Login/>
            </div>
        )
    }
}

export default Welcome;