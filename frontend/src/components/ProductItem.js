import { Card, Col } from 'react-bootstrap'
import { useNavigate } from 'react-router-dom'

const ProductItem = ({data}) => {
    const navigate = useNavigate()
    return (
        <Col xl={3} lg={4} sm={6} className="mt-3" onClick={() => navigate(`/product/${data.id}`)}>
            <Card style={{  width: 225,
                            cursor: 'pointer',
                            border: '0px solid #ccc',
                            borderRadius: '5px',
                            boxShadow: '5px 5px 10px rgba(0, 0, 0, 0.2)' }}>
                {data.image ? (
                    <Card.Img variant="top" src={process.env.REACT_APP_IMG_URL + data.image} />
                ) : (
                    <Card.Img variant="top" src="http://via.placeholder.com/200" />
                )}
                <Card.Body style={{height: 130, overflow: 'hidden'}}>
                    <p>Бренд: {data.brand.name}</p>
                    <strong>{data.name}</strong>
                    <p></p>
                    <p>Цена: {data.price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ' ')}.00 руб.</p>
                </Card.Body>
            </Card>
        </Col>
    )
}

export default ProductItem