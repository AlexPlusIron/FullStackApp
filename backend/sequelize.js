import { Sequelize } from 'sequelize'

export default new Sequelize(
    process.env.DB_NAME, // наименование базы данных
    process.env.DB_USER, // имя пользователя для доступа к БД
    process.env.DB_PASS, // пароль пользователя для доступа к БД
    {
        dialect: 'postgres',
        host: process.env.DB_HOST,
        port: process.env.DB_PORT,
        define: {
            
            underscored: true
        },
        logging: false,
        timezone: 'Europe/Moscow',
    }
)
