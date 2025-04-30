# AWS Scalable Web Application

This project is a proof of concept (POC) to design and deploy a highly available, scalable, and secure web application on AWS Cloud. It follows AWS Well-Architected Framework principles and demonstrates best practices for cloud-based deployments.

## 📌 Objectives

- Architect a web application using AWS core services
- Implement high availability and auto scaling
- Separate application and database layers
- Configure secure networking and permissions
- Estimate cost using AWS Pricing Calculator
- Deploy and test a functional web app

## 📷 Architecture Diagram

> Insert your AWS architecture diagram here (e.g., VPC, EC2, RDS, ALB)

## 🧱 Technologies Used

- Amazon EC2
- Amazon RDS (MySQL)
- AWS Secrets Manager
- Amazon VPC
- AWS Cloud9
- Load Balancer & Auto Scaling Group
- IAM Roles & Policies

## 🚀 Deployment Phases

### Phase 1: Planning & Cost Estimation
- Architecture diagram creation
- Cost estimation

### Phase 2: Basic App Deployment
- Create VPC and subnet
- Launch EC2 instance with Ubuntu and JavaScript app
- Validate functionality (view, add, delete, modify student records)

### Phase 3: Decoupling Layers
- Move DB to Amazon RDS (MySQL)
- Use AWS Secrets Manager for secure credentials
- Launch new EC2 for web server
- Restrict DB access to private subnet

### Phase 4: High Availability & Scalability
- Add Load Balancer
- Enable Auto Scaling Group
- Improve fault tolerance and performance

## 🔐 Security Measures

- Database not exposed to public internet
- Proper port restrictions (SSH, HTTP, MySQL)
- Credentials managed securely via Secrets Manager
- IAM roles for fine-grained access control

## 📈 Performance Goals

- Smooth user experience under peak loads
- Fast response time for CRUD operations
- Scalable architecture to support growth

## 💰 Cost Optimization

- Estimated for us-east-1 Region, 12-month usage
- Utilizes t3.micro instances and cost-effective RDS provisioning

## 🧪 Testing

- Manual tests to add/edit/delete student records
- Network and port accessibility checks
- Database connection validation

## 🏁 Conclusion

This project serves as a demonstration of deploying resilient and scalable applications in the AWS Cloud. It adheres to core AWS architecture principles and provides a foundation for real-world implementations.

---

## 📎 License

MIT License
