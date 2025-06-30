const vendorList = []; 

function setVendorsIds(vendors){
    // This function sets IDs for vendors
    // vendors is an array of arrays, where each sub-array represents a vendor
    for (let i = 0; i < vendors.length; i++) {
        // Adding vendor ID as the first element in each vendor array
        vendors[i].unshift(i + 1); 
        vendorList.push(vendors[i]);
    }
    return vendorList;
};

export { setVendorsIds }; // exporting the function to be used in generateSalesData.js


