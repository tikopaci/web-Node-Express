const Joi = require('@hapi/joi');

const schemas = {
    login: Joi.object().keys({
        username: Joi.string().required().messages({
            "string.empty" : "Campo obligatorio."
        }),
        pass: Joi.string().min(3).max(20).required().messages({
            "string.empty" : "Campo obligatorio.",
            "string.max" : "La contraseña no puede tener mas de 20 caractéres.",
            "string.min" : "La contraseña debe tener al menos 3 caractéres."
        }),
    }),
    registro: Joi.object().keys({
        username: Joi.string().required().label('Nombre de usuario'),
        pass: Joi.string().min(3).max(20).required().label('Contraseña'),
        passConfirmation: Joi.any().equal(Joi.ref('pass')).required().label('Confirmar contraseña').messages({ 
            'any.only': 'Las contraseñas no coinciden' }),
        mail: Joi.string().email().required().label('Email'),
    })
}

module.exports = { schemas };