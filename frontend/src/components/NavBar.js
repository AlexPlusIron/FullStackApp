import { Container, Navbar, Nav } from 'react-bootstrap'
import { NavLink } from 'react-router-dom'
import { AppContext } from './AppContext.js'
import { useContext } from 'react'
import { observer } from 'mobx-react-lite'

const NavBar = observer(() => {
    const { user, basket } = useContext(AppContext)
    return (
        <Navbar bg="info" variant="light">
            <Container>
                <NavLink to="/" className="navbar-brand">Полый каталог товаров</NavLink>
                <Nav className="ml-auto">
                    {user.isAdmin && (
                        <div style={{
                            backgroundColor: '#555555', 
                            padding: '0px', 
                            borderRadius: '5px', 
                            fontFamily: "'Arial', sans-serif",
                          }}>
                        <NavLink to="/admin" className="nav-link">Панель управления</NavLink>
                        </div>
                    )}
                    
                    {user.isAuth ? (
                        <NavLink to="/user" className="nav-link">Личный кабинет</NavLink>
                    ) : (
                        <>
                        <div style={{
                            backgroundColor: '#555555', 
                            padding: '0px', 
                            borderRadius: '5px', 
                            fontFamily: "'Arial', sans-serif",
                          }}>
                            <NavLink to="/login" className="nav-link">Вход в ЛК</NavLink>
                        </div>
                            <NavLink to="/signup" className="nav-link">Регистрация</NavLink>
                        </>
                    )}
                    <NavLink to="/contacts" className="nav-link">Контакты</NavLink>
                    <NavLink to="/delivery" className="nav-link">Доставка</NavLink>
                    <NavLink to="/basket" className="nav-link">
                        Корзина
                        {!!basket.count && <span>({basket.count})</span>}
                    </NavLink>
                </Nav>
            </Container>
        </Navbar>
    )
})

export default NavBar