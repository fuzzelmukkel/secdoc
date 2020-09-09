import React from 'react';
import * as Icon from 'react-feather';
import {Link, Route} from 'react-router-dom';
import './Dashboard.css';
import {withRouter} from "react-router";

function DashBox(props) {
    return (
        <div className="dash-box">
            <Link to={props.link}>
                <div className={"dash-card dash-" + props.dashClass }>
                    <span className="title">{props.title}</span>
                    <span className="value">{props.children}</span>
                </div>
            </Link>
        </div>
    )
}

class CountDashBox extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            dashClass: "info",
            value: <Icon.Loader />
        }
    }

    update = () => {
        fetch(this.props.apiEndpoint)
            .then(res => res.json())
            .then((js) => {
                if(js.success) {
                    this.setState(state => ({
                        value: js.count
                    }))
                }
                else
                {
                    this.setState(state => ({
                        value: "err"
                    }))
                }
            });

    }

    componentDidMount() {
        this.interval = setInterval(() => this.update(), 5000);
        this.update()
    }

    componentWillUnmount() {
        clearInterval(this.interval);
    }

    render() {
        return <DashBox link={this.props.link} dashClass={this.state.dashClass} title={this.props.title}>{this.state.value}</DashBox>;
    }
}

class Dashboard extends React.Component {
    constructor(props) {
        super(props);
        this.state = {}
    }

    render() {
        return (
            <div className="card-deck">
                <CountDashBox apiEndpoint="/assets/ajax/verwaltung.php?action=list" title="Anzahl Verfahren"/>
            </div>
        )
    }
}

export default withRouter(Dashboard);
