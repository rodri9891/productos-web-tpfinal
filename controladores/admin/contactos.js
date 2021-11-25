const Contacto = require('./../../modelos/contacto');

async function getListado(req, res){
    const contactos = await Contacto.getAllContactos();
    res.render('admin/contactos/lista.ejs',{
        lista: contactos
    });
}

async function getEliminar(req, res){
    const id = req.params.id;
    if (await Contacto.eliminarContacto(id) != 0){
        req.flash('error', 'La Marca no puede ser eliminada. ');
    }
    res.redirect('/admin/contactos');
    
}

module.exports = {getListado, getEliminar}