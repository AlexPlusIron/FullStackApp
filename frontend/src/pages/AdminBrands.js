import { useState, useEffect } from 'react'
import { fetchBrands, deleteBrand } from '../http/catalogAPI.js'
import { Button, Container, Spinner, Table } from 'react-bootstrap'
import EditBrand from '../components/EditBrand.js'

const AdminBrands = () => {
    const [brands, setBrands] = useState(null) 
    const [fetching, setFetching] = useState(true) 
    const [show, setShow] = useState(false) 
   
    const [change, setChange] = useState(false)
   
    const [brandId, setBrandId] = useState(0)

    const handleCreateClick = () => {
        setBrandId(0)
        setShow(true)
    }

    const handleUpdateClick = (id) => {
        setBrandId(id)
        setShow(true)
    }

    const handleDeleteClick = (id) => {
        deleteBrand(id)
            .then(
                data => {
                    setChange(!change)
                    alert(`Бренд «${data.name}» удален`)
                }
            )
            .catch(
                error => alert(error.response.data.message)
            )
    }

    useEffect(() => {
        fetchBrands()
            .then(
                data => setBrands(data)
            )
            .finally(
                () => setFetching(false)
            )
    }, [change])

    if (fetching) {
        return <Spinner animation="border" />
    }

    return (
        <Container>
            <h1>Редактирование списка брендов</h1>
            <Button onClick={() => handleCreateClick()}>+ новый бренд</Button>
            <EditBrand id={brandId} show={show} setShow={setShow} setChange={setChange} />
            {brands.length > 0 ? (
                <Table bordered hover size="sm" className="mt-3">
                <thead>
                    <tr>
                        <th>Название</th>
                        <th>Редактировать</th>
                        <th>Удалить</th>
                    </tr>
                </thead>
                <tbody>
                    {brands.map(item => 
                        <tr key={item.id}>
                            <td>{item.name}</td>
                            <td>
                                <Button variant="success" size="sm" onClick={() => handleUpdateClick(item.id)}>
                                   ... редактировать
                                </Button>
                            </td>
                            <td>
                                <Button variant="danger" size="sm" onClick={() => handleDeleteClick(item.id)}>
                                    - удалить
                                </Button>
                            </td>
                        </tr>
                    )}
                </tbody>
                </Table>
            ) : (
                <p>Список брендов пуст</p>
            )}
        </Container>
    )
}

export default AdminBrands