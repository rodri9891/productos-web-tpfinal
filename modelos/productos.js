const Sequelize = require('sequelize');
const path = require('path');
const {Categorias} = require('./categorias');
const {Usuarios} = require('./usuarios');
const {Marcas} = require('./marcas');
const {Modelos} = require('./modelos');
const {unlink} = require('fs-extra');

const Productos = sequelize.define('productos',{
    id: {type: Sequelize.INTEGER, primaryKey: true, autoIncrement: true },
    descripcion: Sequelize.TEXT,
    fecha_publi: Sequelize.DATEONLY,
    estado: { type: Sequelize.BOOLEAN, allowNull: false, defaultValue: true},
    imagen: Sequelize.STRING,
    precio: Sequelize.FLOAT,
    rank: Sequelize.FLOAT,
    titulo: Sequelize.STRING,
    destacado: { type: Sequelize.BOOLEAN, allowNull: false, defaultValue: false}
});

// se agrega allownull porque al borrar te deja la columna null

Productos.belongsTo(Usuarios, {foreignKey:  {name: 'usuarios_fk', allowNull:false}, targetKey: 'id', as: "usuarios"});
Productos.belongsTo(Categorias, {foreignKey: {name: 'categorias_fk', allowNull:false}, targetKey: 'id', as: "categorias"});
Productos.belongsTo(Marcas, {foreignKey:  {name: 'marcas_fk', allowNull:false}, targetKey: 'id', as: "marcas"});


/*function getProductos(){
    global.sequelize.query('SELECT productos.id FROM `productos` INNER JOIN `marcas` INNER JOIN `usuarios` ON productos.marcaId = marcas.id WHERE productos.destacado = 1 ORDER BY RAND() LIMIT 2',
    { replacements: ['active'], type: sequelize.QueryTypes.SELECT }
    ).then(projects => {
        console.log(projects);
        const datos = projects;
        return datos;
    })

}
*/

async function getAllProductosE(){
    const datos = await Productos.findAll(
        {
            where:{
                estado: 1
            },
        include: [
            {model: Usuarios, as:"usuarios"},
            {model: Categorias, as:"categorias"},
            {model: Marcas, as: "marcas"}
        ]
    });
    return datos;
}

async function getAllProductosAdmin(){
    const datos = await Productos.findAll(
        {
        include: 
        [
            {model: Usuarios, as:"usuarios"},
            {model: Categorias, as:"categorias"},
            {model: Marcas, as: "marcas"}
            
        ]
    });
    return datos;
}

async function getProductos(){
    const datos = await Productos.findAll(
        {
            where:{
                destacado: 1,
            },
            order: Sequelize.literal('rand()'),
        include: [
            {model: Usuarios, as:"usuarios"},
            {model: Categorias, as:"categorias"},
            {model: Marcas, as: "marcas"}
        ],
        limit: 6
    });
    return datos;
}
// productoId o poner id es lo mismo porque tiene como parametro y proviene del get
async function getProducto(productoId){
    const datos = await Productos.findAll({
        where:{
            id: productoId
        },
        include:[
            {model: Usuarios, as: "usuarios"},
            {model: Categorias, as: "categorias"},
            {model: Marcas, as: "marcas"}
        ]
    });
    return datos[0];
}

async function eliminarProducto(id){
    const imgdel = await Productos.findOne({where:{id:id}});
    await unlink(path.resolve('./public/' + imgdel.imagen));
    await Productos.destroy(
      {
        where:{id: id}
      }
      ).then(categoria=>{
        return 0;
      }).catch(function(err){
        console.log("algo fallo en el borrado "+err);
        return -1;
    });
  }

async function guardar(req){
  await Productos.create({
    titulo: req.body.titulo,
    descripcion: req.body.descripcion,
    fecha_publi: req.body.fecha_publi,
    imagen: '/assets/img/upload/' + req.file.filename,
    precio: req.body.precio,
    usuarios_fk: req.body.usuario,
    categorias_fk: req.body.categoria,
    marcas_fk: req.body.marca,
    modelos_fk: req.body.modelo 
  })
}

async function modificar(id, datos){
    const nuevoProd = await Productos.findOne({where:{id:id}});
    nuevoProd.titulo = datos.titulo,
    nuevoProd.descripcion = datos.descripcion,
    nuevoProd.fecha_publi = datos.fecha_publi,
    nuevoProd.precio = datos.precio,
    nuevoProd.usuarios_fk = datos.usuario,
    nuevoProd.categorias_fk = datos.categoria,
    nuevoProd.marcas_fk = datos.marca,
    nuevoProd.modelo_fk = datos.modelo,
    nuevoProd.save();
  }

module.exports = {getProductos, getProducto, getAllProductosE, getAllProductosAdmin, eliminarProducto, guardar, modificar}