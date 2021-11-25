const Usuarios = require('./../../modelos/usuarios');
const crypto = require('crypto');

async function getListado(req, res){
    const usuarios = await Usuarios.getAllUsuarios();
    res.render('admin/usuarios/lista.ejs',{
        lista: usuarios
    });
}

function getLogin(req, res){
    res.render('admin/usuarios/login.ejs',{
        message: ''
    });
}

function checkUser(req, res, next){ 
    if (!req.user) {
        res.redirect('/login');
    }else{
        next();
    }
}

async function postLogin(req,res){ 
    const dbUser = await Usuarios.getUsuarioLogin(req.body.correo,req.body.clave);
    if(dbUser){
        const authToken = generateAuthToken(); 
        authTokens[authToken] = {
            "user":dbUser
        }; 
        res.cookie('AuthToken', authToken );

        res.redirect('/admin');
    }else{
        res.render('admin/usuarios/login.ejs',{
            message: 'Usuario inválido'
        });
    }
}  

async function nuevoUsuario(req, res){
    listaUsuarios = await Usuarios.getAllUsuarios();
    res.render('admin/usuarios/abmForm.ejs',{
        marcas: listaUsuarios,
        // se agrega data como objeto vacio ya que se reutiliza para modificar
        data : {},
    });
}

async function guardarUsuario(req, res){
    const body = req.body;
    await Usuarios.guardar(body)
    res.redirect('/admin/usuarios');
        
}

async function getEliminar(req, res){
    const id = req.params.id;
    if (await Usuarios.eliminarUsuario(id) != 0){
        req.flash('error', 'El usuario no puede ser eliminada. ');
    }
    res.redirect('/admin/usuarios');
    
}

function generateAuthToken(){
    return crypto.randomBytes(30).toString('hex');
}

function getLogout(req, res){
    const authToken = req.cookies['AuthToken'];
    delete authTokens[authToken];
    res.cookie('AuthToken', '', {maxAge: -3000});
    res.redirect('/login');

}

module.exports = {getListado, nuevoUsuario, guardarUsuario, getEliminar, getLogin, checkUser, postLogin, getLogout}