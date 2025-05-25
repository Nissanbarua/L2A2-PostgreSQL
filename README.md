### 1. What is PostgreSQL?
--> PostgreSQL হচ্ছে  ওপেন সোর্স ডেটাবেজ ম্যানেজমেন্ট সিস্টেম, যা আমরা কম্পিউটারে তথ্য জমা রাখা, খোঁজা, আপডেট করা এবং মুছে ফেলার জন্য ব্যবহার করি|
### 2. What is the purpose of a database schema in PostgreSQL?
--> PostgreSQL-এর স্কিমা (Schema) হলো ডেটাবেজের ভেতরে থাকা এক ধরনের বিভাগ বা ফোল্ডার, যেটা তথ্য (যেমন টেবিল, ফাংশন) গুছিয়ে রাখে। অর্থাৎ Schema হলো PostgreSQL-এ তথ্য গুছিয়ে রাখার এক ধরনের
পদ্ধতি।
### 3. Explain the Primary Key and Foreign Key concepts in PostgreSQL.
--> 
#### Primary Key =>
Primary Key হলো একটি টেবিলের বিশেষ চিহ্ন বা আইডি, যেটা প্রতিটি রেকর্ডকে আলাদা করে চেনায়।
```
ranger_id | name         | region
----------|--------------|-------------
1         | Alice Green  | Northern Hills
2         | Bob White    | River Delta
```
### Foregin Key 
Foreign Key হলো এমন একটি কলাম (বা ফিল্ড), যেটি অন্য টেবিলের Primary Key-এর সাথে যুক্ত থাকে। এর মাধ্যমে দুই টেবিলের মধ্যে সম্পর্ক তৈরি হয়।
```
sighting_id | ranger_id | species_id | location
------------|-----------|------------|----------
1           | 1         | 2          | Hilltop
```
 ### 4. What is the difference between the VARCHAR and CHAR data types?
 --> VARCHAR এবং CHAR — দুইটাই PostgreSQL-এ টেক্সট বা লেখা রাখার ডেটা টাইপ|
 #### VARCHAR (Variable Character)
 - লেখার দৈর্ঘ্য অনুযায়ী জায়গা নেয়
 - অল্প জায়গা খরচ করে
 - বেশি ব্যবহার হয়
```
 name VARCHAR(20)
```
#### CHAR (Character)
- নির্দিষ্ট দৈর্ঘ্যের লেখা লিখা যায়
- সবসময় নির্ধারিত জায়গা নেয় (পুরোটা)
- কমনভাবে ফিক্সড-সাইজ ডেটার জন্য ব্যবহার হয়
```
code CHAR(5)
```
### 5. What are the LIMIT and OFFSET clauses used for?
--> LIMIT এবং OFFSET — এই দুটি PostgreSQL-এ ডেটা নির্দিষ্ট সংখ্যায় দেখাতে এবং কোন পজিশন থেকে শুরু করে দেখাতে ব্যবহার হয়।
#### LIMIT =>
LIMIT দিয়ে  কয়টা রেকর্ড (সারি) দেখাবে তা নির্দেশ করে|
```
SELECT * FROM species LIMIT 5;
```
#### OFFSET =>
OFFSET দিয়ে কয়টি রেকর্ড স্কিপ করে শুরু করবো তা নির্দেশ করে
```
SELECT * FROM species OFFSET 5;
```
#### ব্যাবহার =>
- ওয়েবসাইটে পেইজ করে ডেটা দেখাতে (pagination)
- বড় টেবিল থেকে অল্প কিছু ডেটা তুলে আনতে


 
