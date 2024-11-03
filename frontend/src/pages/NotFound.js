import { Container, Row, Col, Card, CardGroup, Image } from 'react-bootstrap'
import { FaExclamationTriangle } from 'react-icons/fa'

const NotFound = () => {
    return (
        <Container className="mt-5">
            <Row className="justify-content-center">
                <Col lg={8}>
                    <CardGroup>
                        <Card style={{ border: '2px solid #ccc', borderRadius: '10px', boxShadow: '5px 5px 10px rgba(0, 0, 0, 0.2)' }}>
                            <Card.Body>
                                <Row className="justify-content-center">
                                    <Col md={4}>
                                        <FaExclamationTriangle size={50} color="#dc3545" style={{ marginBottom: '20px' }} />
                                    </Col>
                                </Row>
                                <Card.Title style={{ fontFamily: 'Arial, sans-serif', fontSize: '24px', fontWeight: 'bold', textAlign: 'center', marginBottom: '20px' }}>Страница не найдена</Card.Title>
                                <Card.Text style={{ fontFamily: 'Arial, sans-serif', fontSize: '16px', textAlign: 'center' }}>
                                    Извините, но запрошенная вами страница не найдена. Возможно, вы ввели неверный адрес или страница была удалена.
                                </Card.Text>
                                <Row className="justify-content-center">
                                    <Col md={4}>
                                        <a href="/" className="btn btn-primary" style={{ fontFamily: 'Arial, sans-serif', fontSize: '16px' }}>Вернуться на главную</a>
                                    </Col>
                                </Row>
                            </Card.Body>
                        </Card>
                    </CardGroup>
                </Col>
            </Row>
        </Container>
    )
}

export default NotFound



// import Container from 'react-bootstrap/Container'

// const NotFound = () => {
//     return (
//         <Container>
//             <h1>Страница не найдена</h1>
//         </Container>
//     )
// }

// export default NotFound