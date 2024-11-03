import { Container, Row, Col, Card, CardGroup } from 'react-bootstrap'
import { FaTruck } from 'react-icons/fa'

const Delivery = () => {
    return (
        <Container className="mt-5">
            <Row className="justify-content-center">
                <Col lg={8}>
                    <CardGroup>
                        <Card style={{ border: '1px solid #ccc', borderRadius: '10px', boxShadow: '5px 5px 10px rgba(0, 0, 0, 0.2)' }}>
                            <Card.Body>
                                <Card.Title style={{ fontFamily: 'Arial, sans-serif', fontSize: '24px', fontWeight: 'bold', textAlign: 'center', marginBottom: '20px' }}>Доставка</Card.Title>
                                <Row>
                                    <Col lg={12}>
                                        <div style={{ display: 'flex', alignItems: 'center', marginBottom: '15px' }}>
                                            <FaTruck size={20} color="#007bff" style={{ marginRight: '10px' }} />
                                            <p style={{ fontFamily: 'Arial, sans-serif', fontSize: '16px' }}>Мы осуществляем доставку по Москве и Московской области.</p>
                                        </div>
                                        <div style={{ fontFamily: 'Arial, sans-serif', fontSize: '16px' }}>
                                            <p>Стоимость доставки:</p>
                                            <ul>
                                                <li>Москва: бесплатно при заказе от 3000 руб., в иных случаях 300 руб.</li>
                                                <li>Московская область: 500 руб.</li>
                                            </ul>
                                            <p>Срок доставки:</p>
                                            <ul>
                                                <li>Москва: 1-2 рабочих дня</li>
                                                <li>Московская область: 2-3 рабочих дня</li>
                                            </ul>
                                        </div>
                                        <div style={{ fontFamily: 'Arial, sans-serif', fontSize: '16px' }}>
                                            <p>Способы доставки:</p>
                                            <ul>
                                                <li>Самовывоз (адрес указан в разделе "Контакты")</li>
                                                <li>Курьерская доставка</li>
                                                <li>Транспортные компании (CDEK, DPD, Почта России)</li>
                                            </ul>
                                        </div>
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

export default Delivery



// import Container from 'react-bootstrap/Container'

// const Delivery = () => {
//     return (
//         <Container>
//             <h1>Доставка</h1>
//         </Container>
//     )
// }

// export default Delivery