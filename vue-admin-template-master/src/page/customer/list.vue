
<template>
    <div>
       <el-button type="primary" size="small" @click="toAddHandler">添加</el-button>
       <el-button type="danger" size="small">批量删除</el-button>
       
       <el-table :data="employees">
           <el-table-column fixed="left" prop="id" label="编号"></el-table-column>
            <el-table-column fixed="left" prop="username" label="用户名"></el-table-column>
           <el-table-column prop="realname" label="姓名"></el-table-column>
           <el-table-column prop="gender" label="性别"></el-table-column>
           <el-table-column width=120px prop="telephone" label="手机号"></el-table-column>
           <el-table-column width=240px prop="idCard" label="身份证号"></el-table-column>
           <el-table-column width=240px prop="bankCard" label="银行卡号"></el-table-column>
           <el-table-column fixed="right" label="操作">
                <template v-slot="slot">
                  <a href="" @click.prevent="toDeleteHandler(slot.row.id)">删除</a>
                  <a href="" @click.prevent="toUpdateHandler(slot.row)">修改</a>
              </template>
           </el-table-column>
       </el-table>  
        <!--分页符-->
       <el-pagination
          layout="prev, pager, next"
           :total="50">
        </el-pagination> 
        <!--/分页符-->
              <!--模态框-->
        <el-dialog
            title="录入顾客信息"
            :visible.sync="visible"
            width="60%">
            <el-form :model=form label-width="80px">
                <el-form-item label="用户名">
                    <el-input v-model="form.username"/>
                </el-form-item>
                <el-form-item label="密码">
                    <el-input type="password" v-model="form.password"/>
                </el-form-item>
                <el-form-item label="姓名">
                    <el-input v-model="form.realname"/>
                </el-form-item>
                <el-form-item label="性别">
                    <el-radio-group v-model="form.gender">
                        <el-radio label="男">男</el-radio>
                        <el-radio label="女">女</el-radio>
                    </el-radio-group>
                </el-form-item>
                <el-form-item label="手机号">
                    <el-input v-model="form.telephone"/>
                </el-form-item>
                <el-form-item label="身份证号">
                    <el-input v-model="form.idCard"/>
                </el-form-item>
                <el-form-item label="银行卡号">
                    <el-input v-model="form.bankCard"/>
                </el-form-item>
            </el-form>
            <span slot="footer" class="dialog-footer">
                <el-button @click="closModleHandler" >取 消</el-button>
                <el-button type="primary" @click="closModleHandler" >确 定</el-button>
            </span>
        </el-dialog>
        <!--/模态框-->
    </div>
</template>
<script>
import request from '@/utils/request'
import querystring from 'querystring'
export default {
    methods:{
        submitHandler(){
            let url = "http://localhost:6677//waiter/saveOrUpdate"
            request({
                url,
                method:"POST",
                headers:{
                    "Conten-Type":"application/x-form-urlencoded"
                },
                data:querystring.stringfy(this.form)
            })
        },
        loadData(){
            let url = "http://localhost:6677/waiter/findAll";
            request.get(url).then((response)=>{
                this.employees = response.data;
            }).then((response)=>{
                // 模态框关闭
              this.closeModalHandler();
                 // 刷新
              this.loadData();
                 // 提示消息
              this.$message({
                  type:"success",
                  message:response.message
              })
          })
        },
        toDeleteHandler(id){
            //确认
            this.$confirm('此操作将永久删除该文件, 是否继续?', '提示', {
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                type: 'warning'
            }).then(() => {
             this.$message({
                type: 'success',
                message: '删除成功!'
             });
            })
        },
        toUpdateHandler(){
            this.visible = true;
        },
       closModleHandler(){
           this.visible = false;
       },
        toAddHandler(){
            this.title = "录入顾客信息";
            this.visible = true ;
        }
    },
    data(){
        return {
            title:"录入顾客信息",
            visible:false,
            employees:[],
            form:{
                type:"waiter"
            }
        }  
    },
    created(){
        //在页面加载出来的时候加载数据
        this.loadData();
    }
}
</script>
<style scoped>
</style>
