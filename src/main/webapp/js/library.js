/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function validateBuyer()
{
    
	var f = document.buyerForm;
	
	if(f.name.value == 0)
	{
            alert("Por favor ingrese un número de tarjeta de crédito");
            f.name.focus();
            return false;
	}
	if(!f.name.value.match(/[a-zA-ZáéíóúñÁÉÍÓÚÑ]+$/i))
	{
            alert("El campo nombre debe contener solo caracteres alfabéticos");
            f.name.focus();
            return false;
	}
	if(f.creditCardNumber.value == 0)
	{
            alert("Por favor ingrese un número de tarjeta de crédito");
            f.creditCardNumber.focus();
            return false;
	}
	if(!f.creditCardNumber.value.match(/[0-9]+$/i))
	{
            alert("El campo número de tarjeta de crédito debe contener solo caracteres numéricos");
            f.creditCardNumber.focus();
            return false;
	}
	if(f.creditCardNumber.value.length != 12)
	{
            alert("El número de tarjeta de crédito debe contener 12 caracteres " + f.creditCardNumber.value.length);
            f.creditCardNumber.focus();
            return false;
	}
	if(f.creditCardCode.value == 0)
	{
            alert("Por favor ingrese un número de seguridad de la tarjeta de crédito");
            f.creditCardCode.focus();
            return false;
	}
	if(!f.creditCardCode.value.match(/[0-9]+$/i))
	{
            alert("El campo número de seguridad de la tarjeta de crédito debe contener solo caracteres numéricos");
            f.creditCardCode.focus();
            return false;
	}
	if(f.creditCardCode.value.length != 3)
	{
            alert("El número de seguridad de la tarjeta de crédito debe contener 3 caracteres");
            f.creditCardNumber.focus();
            return false;
	}
	f.submit();
}
