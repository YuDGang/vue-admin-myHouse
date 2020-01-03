let student = {
    name:"学生",
    save(){
        console.log("保存",this.name);
    },
    delete(){
        console.log("删除",this.name);
    },
    update(){
        console.log("更新",this.name);
    }
}

module.exports = student;   // commonjs写法
// export default student; // webpack写法