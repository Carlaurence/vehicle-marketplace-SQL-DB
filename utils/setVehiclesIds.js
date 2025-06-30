const vehicleList = [];

function setVehiclesIds(vehicles) { 
    // This function sets IDs for vehicles
    // vehicles is an array of arrays, where each sub-array represents a vehicle
    for (let i = 0; i < vehicles.length; i++) {
        // Adding vehicle ID as the first element in each vehicle array
        vehicles[i].unshift(i + 1); 
        vehicleList.push(vehicles[i]);
    }
    return vehicleList;
}   

export { setVehiclesIds }; // Exporting the function to be used in generateSalesData.js

