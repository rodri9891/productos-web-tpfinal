const Sequelize = require('sequelize');
const crypto = require('crypto');

const Usuarios = sequelize.define('usuarios',{
    id: {type: Sequelize.INTEGER, primaryKey: true, autoIncrement: true },
    nombre: Sequelize.STRING,
    apellido: Sequelize.STRING,
    correo: Sequelize.STRING,
    telefono: Sequelize.INTEGER,
    clave: Sequelize.STRING,
    perfil: Sequelize.STRING,
})
function getHashPass(clave){
  const sha256 = crypto.createHash('sha256');
  const hash = sha256.update(clave).digest('base64');
  return hash;
}
/*Usuarios.beforeCreate((user, options) => {

  return bcrypt.hash(user.clave, 10)
  .then(hash => {
  user.clave = hash;
  })
  .catch(err => {
  throw new Error();
  });
  });
*/
async function getAllUsuarios(){
    const datos = await Usuarios.findAll();
    return datos;
}

async function guardar(datos){
    await Usuarios.create({
      nombre: datos.nombre,
      apellido: datos.apellido,
      correo: datos.correo,
      telefono: datos.telefono,
      clave: getHashPass(datos.clave),
      perfil: datos.perfil, 
    })
  }


async function eliminarUsuario(id){

  await Usuarios.destroy(
    {
      where:{id: id}
    }
    );
}

async function getUsuarioLogin(correo,clave) {
  const datos = await Usuarios.findOne(
    {
      attributes: ['nombre','apellido','correo','id'],
      where: {
        correo: correo,
        clave: getHashPass(clave)
      }
    }
  );  
  return datos;
}

module.exports = {Usuarios, getAllUsuarios, guardar, eliminarUsuario, getUsuarioLogin}