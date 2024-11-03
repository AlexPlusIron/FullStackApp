import { Container, Row, Col, Button, Image, Spinner, Card, CardGroup, Table } from 'react-bootstrap'
import { useEffect, useState, useContext } from 'react'
import { fetchOneProduct, fetchProdRating } from '../http/catalogAPI.js'
import { useParams } from 'react-router-dom'
import { append } from '../http/basketAPI.js'
import { AppContext } from '../components/AppContext.js'

const Product = () => {
    const { id } = useParams()
    const { basket } = useContext(AppContext)
    const [product, setProduct] = useState(null)
    const [rating, setRating] = useState(null)

    useEffect(() => {
        fetchOneProduct(id).then(data => setProduct(data))
        fetchProdRating(id).then(data => setRating(data))
    }, [id])

    const handleClick = (productId) => {
        append(productId).then(data => {
            basket.products = data.products
        })
    }

    if (!product) {
        return <Spinner animation="border" />
    }

    return (
        <Container className="mt-5">
            <Row className="justify-content-center">
                <Col lg={8}>
                    <CardGroup>
                        <Card style={{
                            border: '0px solid #ccc',
                            borderRadius: '5px',
                            boxShadow: '5px 5px 10px rgba(0, 0, 0, 0.2)' }}>
                            <Row>
                                <Col lg={5} className="p-0">
                                    <Card.Img 
                                        variant="top"
                                        src={product.image ? (process.env.REACT_APP_IMG_URL + product.image) : ("http://via.placeholder.com/300")} 
                                        style={{ height: '300px', width: '300px', marginLeft: '25px' }}
                                    />
                                </Col>
                                <Col lg={7} className="p-3">
                                    <Card.Body style={{ marginLeft: '35px' }}>
                                        <Card.Title style={{ fontFamily: 'Arial, sans-serif', fontSize: '24px', fontWeight: 'bold' }}>{product.name}</Card.Title>
                                        <Card.Text style={{ fontFamily: 'Arial, sans-serif', fontSize: '18px' }}>
                                            
                                            <p>Бренд: {product.brand.name}</p>
                                            <p>Категория: {product.category.name}</p>
                                            {rating && (
                                                <p>Рейтинг: {rating.rating}, голосов: {rating.votes}</p>
                                            )}
                                        </Card.Text>
                                        <Button 
                                            variant="info" 
                                            onClick={() => handleClick(product.id)} 
                                            style={{
                                                fontFamily: 'Arial, sans-serif',
                                                fontSize: '16px',
                                                fontWeight: 'bold',
                                                boxShadow: '5px 5px 10px rgba(0, 0, 0, 0.2)'
                                             }}
                                        >
                                            Цена: <b>{product.price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ' ')}.00 руб.</b>
                                        </Button>
                                    </Card.Body>
                                </Col>
                            </Row>
                        </Card>
                    </CardGroup>
                </Col>
            </Row>
            {!!product.props.length && 
                <Row className="mt-3">
                    <Col>
                        <h3 style={{ fontFamily: 'Arial, sans-serif', fontSize: '20px', fontWeight: 'bold' }}>Характеристики</h3>
                        <Table bordered hover size="sm" style={{ fontFamily: 'Arial, sans-serif', fontSize: '14px' }}>
                            <tbody>
                                {product.props.map(item => 
                                    <tr key={item.id}>
                                        <td>{item.name}</td>
                                        <td>{item.value}</td>
                                    </tr>
                                )}
                            </tbody>
                        </Table>
                    </Col>
                </Row>
            }
        </Container>
    )
}

export default Product
