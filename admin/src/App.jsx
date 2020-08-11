import React from 'react';
import "./App.css"
import {Link, withRouter} from 'react-router-dom';
import {Col, Container, Nav, Navbar, Row} from "react-bootstrap";
import {Sidebar} from "react-feather";
import {BrowserRouter as Router} from "react-router-dom";

class App extends React.Component {
    constructor(props) {
        super(props);
        this.state = {

        }
    }

    componentDidMount() {

    }


    componentWillUnmount() {

    }

    render() {
        return (
            <Router>
                <Container fluid>
                    <div className={"logo-container-left"}>
                        <img src={"/logo1.png"} width={"200px"} alt={"Logo der WWU"} />
                    </div>
                    <div className={"logo-container-right"}>
                        <img src={"/logo2.png"} width={"200px"} alt={"Logo secDoc"}/>
                    </div>
                    <Row>
                        <Col md={10} className={"content-fg offset-md-1"}>
                            <Navbar className="sticky-top" expand="lg">
                                <Link to="/">
                                    <Navbar.Brand>
                                        secdoc Admin Interface
                                    </Navbar.Brand>
                                </Link>

                                <Navbar.Text className="ml-auto mr-5">
                                    Login Status
                                </Navbar.Text>
                            </Navbar>

                            <Container fluid>
                                <Row>
                                    <Col xs={3} id="sidebar-wrapper">
                                        <Nav className={"flex-column sidebar"}>
                                            <Nav.Link href={"#"}>Lorem ipsum </Nav.Link>
                                            <Nav.Link href={"#"}>asdfasdg ipsum </Nav.Link>
                                            <Nav.Link href={"#"}>Lorem asgfg </Nav.Link>
                                            <Nav.Link href={"#"}>fff ipsum </Nav.Link>
                                            <Nav.Link href={"#"}>Lorem ipfffsum </Nav.Link>
                                            <Nav.Link href={"#"}>fLorem ifpsum </Nav.Link>
                                        </Nav>
                                    </Col>
                                    <Col xs={9}>
                                        <div  id="page-content-wrapper">
                                            Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.
                                        </div>
                                    </Col>
                                </Row>
                            </Container>
                        </Col>
                    </Row>
                </Container>
            </Router>
        )
    }
}

export default App;
