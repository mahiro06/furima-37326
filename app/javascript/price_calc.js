function SellPriceCalc () {
  const price = document.getElementById("item-price");
  const tax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  price.addEventListener("input", () => {
    const value = price.value;
    const taxCalc = value / 10 ; 
    const taxValue = parseInt(taxCalc, 10);
    tax.innerHTML = taxValue.toLocaleString();
    const profitCalc = value - taxCalc;
    const profitValue = parseInt(profitCalc, 10); 
    profit.innerHTML = profitValue.toLocaleString()
  });
};


window.addEventListener('load', SellPriceCalc);