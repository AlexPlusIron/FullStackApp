import { useState, useEffect } from 'react'
import { fetchAllProducts, deleteProduct } from '../http/catalogAPI.js'
import { Button, Container, Spinner, Table, Pagination } from 'react-bootstrap'
import CreateProduct from '../components/CreateProduct.js'
import UpdateProduct from '../components/UpdateProduct.js'

// количество товаров на страницу
const ADMIN_PER_PAGE = 18

const AdminProducts = () => {
    const [products, setProducts] = useState([]) // список загруженных товаров
    const [fetching, setFetching] = useState(true) // загрузка списка товаров с сервера
    const [createShow, setCreateShow] = useState(false) // модальное окно создания товара
    const [updateShow, setUpdateShow] = useState(false) // модальное окно редактирования
    
    const [change, setChange] = useState(false)
    
    const [product, setProduct] = useState(null)

   
    const [currentPage, setCurrentPage] = useState(1)
    
    const [totalPages, setTotalPages] = useState(1)

    
    const handlePageClick = (page) => {
        setCurrentPage(page)
        setFetching(true)
    }

    
    const pages = []
    for (let page = 1; page <= totalPages; page++) {
        pages.push(
            <Pagination.Item
                key={page}
                active={page === currentPage}
                activeLabel=""
                onClick={() => handlePageClick(page)}
            >
                {page}
            </Pagination.Item>
        )
    }

    const handleUpdateClick = (id) => {
        setProduct(id)
        setUpdateShow(true)
    }

    const handleDeleteClick = (id) => {
        deleteProduct(id)
            .then(
                data => {
                    
                    if (totalPages > 1 && products.length === 1 && currentPage === totalPages) {
                        setCurrentPage(currentPage - 1)
                    } else {
                        setChange(!change)
                    }
                    alert(`Товар «${data.name}» удален`)
                }
            )
            .catch(
                error => alert(error.response.data.message)
            )
    }

    useEffect(() => {
        fetchAllProducts(null, null, currentPage, ADMIN_PER_PAGE)
            .then(
                data => {
                    setProducts(data.rows)
                    setTotalPages(Math.ceil(data.count / ADMIN_PER_PAGE))
                }
            )
            .finally(
                () => setFetching(false)
            )
    }, [change, currentPage])

    if (fetching) {
        return <Spinner animation="border" />
    }

    return (
        <Container>
            <h1>Редактирование каталога товаров</h1>
            <Button onClick={() => setCreateShow(true)}>+ новый товар</Button>
            <CreateProduct show={createShow} setShow={setCreateShow} setChange={setChange} />
            <UpdateProduct id={product} show={updateShow} setShow={setUpdateShow} setChange={setChange} />
            {products.length > 0 ? (
                <>
                    <Table bordered hover size="sm" className="mt-3">
                    <thead>
                    <tr>
                        <th style={{ textAlign: 'center' }}>Бренд</th>
                        <th style={{ textAlign: 'center' }}>Название</th>
                        <th style={{ textAlign: 'center' }}>Изображение</th>
                        <th style={{ textAlign: 'center' }}>Категория</th>
                        <th style={{ textAlign: 'center' }}>Цена</th>
                        <th style={{ textAlign: 'center' }}>Редактировать</th>
                        <th style={{ textAlign: 'center' }}>Удалить</th>
                    </tr>
                    </thead>
                    <tbody>
                        {products.map(item => 
                            <tr key={item.id}>
                                <td>{item.brand?.name || 'NULL'}</td>
                                <td>{item.name}</td>
                                <td>
                                    {item.image &&
                                    <a href={process.env.REACT_APP_IMG_URL + item.image} target="_blank" style={{ textDecoration: 'none', display: 'block', textAlign: 'center' }}>фото</a>}
                                </td>
                                <td>{item.category?.name || 'NULL'}</td>
                                
                                <td>{item.price}</td>

                                <td>
                                    <div style={{ display: 'flex', justifyContent: 'center' }}>
                                        <Button variant="success" size="sm" onClick={() => handleUpdateClick(item.id)}>
                                            ... редактировать
                                        </Button>
                                    </div>
                                </td>
                                <td>
                                    <div style={{ display: 'flex', justifyContent: 'center' }}>
                                        <Button variant="danger" size="sm" onClick={() => handleDeleteClick(item.id)}>
                                            - удалить
                                        </Button>
                                    </div>
                                </td>

                               
                            </tr>
                        )}
                    </tbody>
                    </Table>
                    {totalPages > 1 && <Pagination>{pages}</Pagination>}
                </>
            ) : (
                <p>Список товаров пустой</p>
            )}
        </Container>
    )
}

export default AdminProducts