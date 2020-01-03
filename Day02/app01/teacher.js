let teacher = {
    name:"老师",
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
module.exports = teacher;
// export default teacher;