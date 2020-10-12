window.addEventListener('load', function(){

  console.log("hoge");
  const inputPrice = document.getElementById("item-price")
  inputPrice.addEventListener('input', function(){
    const price = inputPrice.value;
    
    const tax = price*0.1
    
    const profit = price*0.9
    
    const inputAddTaxPrice = document.getElementById("add-tax-price")
    const inputProfit = document.getElementById("profit")
    inputAddTaxPrice.innerHTML = tax
  })

});