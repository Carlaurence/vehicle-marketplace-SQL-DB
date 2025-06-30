import { generateSalesData } from "./utils/generateSalesData.js";

// To capture the third arg (salesRecord) from command line: "node node .\generateSalesQueries.js 100"
const saleRecords = process.argv[2] || 100;

if (!saleRecords) {
  console.error('You have to provide a saleRecords in the CLI to be processed');
  process.exit(1);
}

// execute the function to generate sales data with the number of sale records provided from the command line
const salesData = generateSalesData(saleRecords);

// create SQL insert statements for every sale and update the vehicle's availability to false
const salesSQL = salesData.map(sale => {
    return `INSERT INTO sales (vehicle_id, vendor_id, sale_date, sale_price) VALUES (${sale[0]}, ${sale[1]}, '${sale[2]}', ${sale[3]});\nUPDATE vehicles SET is_available = FALSE WHERE id = ${sale[0]};`;
}).join('\n');  

// Output the SQL Queries to the console
console.log(salesSQL);