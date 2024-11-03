import { Container, Row, Col, Button, Card, CardGroup, Image } from 'react-bootstrap'
import { FaMapMarkerAlt, FaPhoneAlt, FaClock, FaInstagram, FaFacebook, FaTelegram } from 'react-icons/fa'
import { AiOutlineMail } from 'react-icons/ai'

const Contacts = () => {
    return (
        <Container className="mt-5">
            <Row className="justify-content-center">
                <Col lg={8}>
                    <CardGroup>
                        <Card style={{ border: '1px solid #ccc', borderRadius: '10px', boxShadow: '5px 5px 10px rgba(0, 0, 0, 0.2)' }}>
                            <Card.Body>
                                <Card.Title style={{ fontFamily: 'Arial, sans-serif', fontSize: '24px', fontWeight: 'bold', textAlign: 'center', marginBottom: '20px' }}>Контакты</Card.Title>
                                <Row>
                                    <Col lg={6}>
                                        <div style={{ display: 'flex', alignItems: 'center', marginBottom: '15px' }}>
                                            <FaMapMarkerAlt size={20} color="#007bff" style={{ marginRight: '10px' }} />
                                            <p style={{ fontFamily: 'Arial, sans-serif', fontSize: '16px' }}>г. Москва, ул. Тверская, д. 12, стр. 1</p>
                                        </div>
                                        <div style={{ display: 'flex', alignItems: 'center', marginBottom: '15px' }}>
                                            <FaPhoneAlt size={20} color="#007bff" style={{ marginRight: '10px' }} />
                                            <p style={{ fontFamily: 'Arial, sans-serif', fontSize: '16px' }}>+7 (495) 123-45-67</p>
                                        </div>
                                        <div style={{ display: 'flex', alignItems: 'center', marginBottom: '15px' }}>
                                            <AiOutlineMail size={20} color="#007bff" style={{ marginRight: '10px' }} />
                                            <p style={{ fontFamily: 'Arial, sans-serif', fontSize: '16px' }}>info@example.com</p>
                                        </div>
                                        <div style={{ display: 'flex', alignItems: 'center', marginBottom: '15px' }}>
                                            <FaClock size={20} color="#007bff" style={{ marginRight: '10px' }} />
                                            <p style={{ fontFamily: 'Arial, sans-serif', fontSize: '16px' }}>Пн-Пт: 9:00 - 18:00</p>
                                        </div>
                                    </Col>
                                    <Col lg={6}>
                                        <Row className="justify-content-center">
                                            <Col md={4}>
                                                <a href="https://www.instagram.com/" target="_blank" rel="noopener noreferrer">
                                                    <FaInstagram size={30} color="#C13584" style={{ margin: '10px' }} />
                                                </a>
                                            </Col>
                                            <Col md={4}>
                                                <a href="https://www.facebook.com/" target="_blank" rel="noopener noreferrer">
                                                    <FaFacebook size={30} color="#3b5998" style={{ margin: '10px' }} />
                                                </a>
                                            </Col>
                                            <Col md={4}>
                                                <a href="https://t.me/" target="_blank" rel="noopener noreferrer">
                                                    <FaTelegram size={30} color="#0088cc" style={{ margin: '10px' }} />
                                                </a>
                                            </Col>
                                        </Row>
                                    </Col>
                                </Row>
                                <Row className="mt-3">
                                    <Col>
                                        <h3 style={{ fontFamily: 'Arial, sans-serif', fontSize: '18px', fontWeight: 'bold' }}>Схема проезда</h3>
                                        <Image src="https://via.placeholder.com/600x300" fluid />
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

export default Contacts


// import Container from 'react-bootstrap/Container'

// const Contacts = () => {
//     return (
//         <Container>
//             <h1>Контакты</h1>
//         </Container>
//     )
// }

// export default Contacts