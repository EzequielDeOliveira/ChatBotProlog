import React, { Component } from 'react';
import TauProlog from 'tau-prolog';

const session = TauProlog.create();

class ChatComponent extends Component {
    constructor(props) {
        super(props);
        this.state = {
            response: 'aaaa'
        };
    }

    testando = async () => {
        session.consult("../../../main.pl");
        session.query('pokemon(pikachu,Y).');
        var callback = console.log;
        session.answer(callback)
    }

    render() {
        return (
            <div style={styles.container}>
                {this.testando}
            </div>
        );
    }
}

const styles = {
    container: {
        backgroundColor: 'blue',
        width: '650px',
    }
}

export default ChatComponent;