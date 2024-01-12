// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: MIT-0

import { S3Client, GetObjectCommand, PutObjectCommand } from "@aws-sdk/client-s3";
const s3client = new S3Client();

const SRC_BUCKET = process.env.SRC_BUCKET;
const DST_BUCKET = process.env.DST_BUCKET;

export const handler = async (event) => {
    const employeeId = extractEmployeeId(event);
    
    if (!employeeId) {
        return {
            statusCode: 400,
            body: JSON.stringify({
                message: 'Invalid employeeId'
            })
        }
    }
    
    const objectKey = `${employeeId}.jpg`;
    
    console.log(`Processing employeeId=${employeeId} bucket=${SRC_BUCKET} key=${objectKey}`);

    const srcImageBase64 = await getImageBase64(objectKey);
    const greentingCardHtml = generateHtml(srcImageBase64);
    await storeGreentingCard(employeeId, greentingCardHtml);

    return {
        statusCode: 200,
        body: JSON.stringify({
            message: 'Processed successfully'
        })
    }
};

function extractEmployeeId(event) {
    console.log(event);
    if (event.body) { // If event is coming from API Gateway
        const requestBody = JSON.parse(event.body);
        return requestBody.employeeId;
    }
    else if (event.Records) { // If event is coming from SQS
        const message = JSON.parse(event.Records[0].body);
        return message.employeeId;
    }
    else {
        return null;
    }
}

async function getImageBase64(objectKey) {
    const command = new GetObjectCommand({
        Bucket: SRC_BUCKET,
        Key: objectKey
    });

    const response = await s3client.send(command);
    const responseByteArray = await response.Body.transformToByteArray();
    const imageBase64 = Buffer.from(responseByteArray).toString('base64');
    return imageBase64;
}

async function storeGreentingCard(employeeId, html) {
    const command = new PutObjectCommand({
        Bucket: DST_BUCKET,
        Key: `greeting-card-${employeeId}.html`,
        Body: html,
        ContentType: 'text/html'
    });

    await s3client.send(command);
}

function generateHtml(imageBase64) {
    const html = `
        <html>
        <head>
            <title>Greeting Card</title>
            <style>
                body { text-align: center; font-family: Arial, sans-serif; }
                img { max-width: 100%; }
            </style>
        </head>
        <body>
            <h1>Happy Terraform+Serverless Development!</h1>
            <img src="data:image/jpeg;base64,${imageBase64}" alt="Employee Image">
        </body>
        </html>
    `;
    return html;
}
