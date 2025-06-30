// File: scripts/generateSalesData.js
import { vehicles } from '../data/vehicles.js'; // Importing vehicles data
import { vendors } from '../data/vendors.js'; // Importing vendors data
import { setVendorsIds } from './setVendorsIds.js'; // Importing function to set IDs for vendors
import { setVehiclesIds } from './setVehiclesIds.js'; // Importing function to set IDs for vehicles


const vendorList = setVendorsIds(vendors); // setting IDs for vendors Data
const vehicleList = setVehiclesIds(vehicles); // setting IDs for vehicles Data

// Function to generate sales data
function generateSalesData(numSales) {
    const salesData = [];
    const startDate = new Date('2025-01-01');
    const endDate = new Date('2025-06-30');

    for (let i = 0; i < numSales; i++) {

        if (vehicleList.length === 0) break; // No more vehicles to sell
        const vehicleIndex = Math.floor(Math.random() * vehicleList.length);
        const selectedVehicle = vehicleList.splice(vehicleIndex, 1)[0]; // Remove sold vehicle from vehicleList and store it in selectedVehicle
        const vendorIndex = Math.floor(Math.random() * vendorList.length);
        const saleDate = new Date(startDate.getTime() + Math.random() * (endDate - startDate));
        const salePrice = selectedVehicle[6]; // Use the price $ from selectedVehicle in position 6

        salesData.push([
            selectedVehicle[0], // Vehicle ID
            vendorList[vendorIndex][0], // Vendor ID
            saleDate.toISOString().split('T')[0], // Sale date in YYYY-MM-DD format
            salePrice // Sale price
        ]);
    }

    return salesData; // returning an array or arrays with sales data
}

export { generateSalesData }; // Exporting the function to be used in generateSalesQueries.js
