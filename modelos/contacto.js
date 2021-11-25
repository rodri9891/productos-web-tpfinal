const Sequelize = require('sequelize');

const Contacto = sequelize.define('contactos',{
    id: {type: Sequelize.INTEGER, primaryKey: true, autoIncrement: true },
    nombre: Sequelize.STRING,
    apellido: Sequelize.STRING,
    correo: Sequelize.STRING,
    telefono: Sequelize.STRING,
    comentario: Sequelize.TEXT,
    motivo: Sequelize.INTEGER,
})



async function guardar(datos){
    var contacto = await Contacto.create({
        nombre: datos.nombre,
        apellido: datos.apellido,
        correo: datos.correo,
        telefono: datos.telefono,
        motivo: datos.motivo, 
        comentario: datos.comentario
    })
    return contacto;
}

async function getAllContactos(){
    const datos = await Contacto.findAll();
    return datos;
}

async function eliminarContacto(id){

    await Contacto.destroy(
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

module.exports = {Contacto, guardar, getAllContactos, eliminarContacto}