// const btnCart =document.querySelector('.carrito')
// btnCart.addEventListener('click',() =>{
//     alert('Funcionaaf')
// })
const btnCart = document.querySelector('.carrito')
const containerCartProducts = document.querySelector('.container-cart-products')

btnCart.addEventListener('click', () => {
    containerCartProducts.classList.toggle('hidden-cart')
})

// const btnCartclose = document.querySelector('.icon-close')
// const a = document.querySelector('.hidden-cart')

// btnCart.addEventListener('click', () => {
//     a.classList.toggle('container-cart-products')
// })