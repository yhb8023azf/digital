<template>
  <div class="tree">
    <el-tree
      :props="props"
      :load="loadNode"
      lazy
      show-checkbox
	  node-key="id"
	  ref="tree"
	  @check="clickDeal"
	  :highlight-current="hignLight"
	  >
    </el-tree>
		<el-button type="success" plain @click="submit">确认</el-button>
  </div>
</template>
<script>
  export default {
    data() {
      return {
			hignLight:true,//是否高亮
			clearPeople:[],//保存勾选叶子结点信息
			submitBranch:[],//保存需要请求的分支节点id
			submitLeaf:[],//保存勾选成员id
			data:{// 从后端请求的数据保存到data中
				data1: [
					{id:1,isLeaf:false,name:"北研1",did:1,pid:6}, 
					{id:2,isLeaf:false,name:"北研2",did:2,pid:6}, 
					{id:3,isLeaf:false,name:"北研3",did:3,pid:6}, 
					{id:4,isLeaf:false,name:"广研1",did:4,pid:6}, 
					{id:5,isLeaf:false,name:"广研2",did:5,pid:6}, 
					{id:6,isLeaf:false,name:"广研3",did:6,pid:6}, 
				],
				data2: [
					{id:7,isLeaf: true,name: '成员1',reallCheck:true,pid:1},
					{id:8,isLeaf: true,name: '成员2',reallCheck:true,pid:1},
					{id:9,isLeaf: false,name: '平台1',reallCheck:false,pid:1,tid:1},
					{id:10,isLeaf: false,name: '平台2',reallCheck:false,pid:1,tid:2},
				],
				data22: [
					{id:17,isLeaf: true,name: '成员3',reallCheck:true,pid:2},
					{id:18,isLeaf: true,name: '成员4',reallCheck:true,pid:2},
					{id:19,isLeaf: false,name: '平台3',reallCheck:false,pid:2,tid:1},
					{id:20,isLeaf: false,name: '平台4',reallCheck:false,pid:2,tid:2},
				],
				data3: [
					{id:11,isLeaf: true,name: '成员1',reallCheck:true,pid:1},
					{id:12,isLeaf: true,name: '成员1',reallCheck:true,pid:1},
					{id:13,isLeaf: false,name: '组1',reallCheck:false,pid:1,zid:1},
					{id:14,isLeaf: false,name: '组2',reallCheck:false,pid:1,zid:2},
				],
				data4: [
					{id:15,isLeaf: true,name: '成员1',reallCheck:true,pid:1},
					{id:16,isLeaf: true,name: '成员1',reallCheck:true,pid:1},
				],
		},
        props: {
          label: 'name',
          children: [],
          isLeaf: 'reallCheck'//向子节点传入布尔值，判断节点，true为叶子节点
        },
      }
    },
    methods: {
		// 取消勾选时，移除高亮
		removeClass(){
			var leafNode2=document.getElementsByClassName("leafColor");
			for(var n=0;n<this.clearPeople.length;n++){
				for(var i=0;i<leafNode2.length;i++){
					leafNode2[i].classList.remove("leafColor")
				}
			}
		},
		// 勾选时，添加高亮
		addClass(data){
			var leafNode1=document.querySelectorAll('.el-tree--highlight-current .el-tree-node.is-checked.is-focusable span.el-tree-node__label')
			for(var i=0;i<data.length;i++){
				for(var j=0;j<leafNode1.length;j++){
					if(data[i]==j){
						leafNode1[j].classList.add("leafColor")
					}
				}	
			}
		},
		// 获取勾选节点信息
		getCheckedNodes() {
			var lists=this.$refs.tree.getCheckedNodes();// 讲勾选节点信息保存到lists中
			var leafList=[];//保存叶子结点
			for(var i=0;i<lists.length;i++){
				if(lists[i].isLeaf==true){
					leafList.push(i)
					this.addClass(leafList)// 调用addClass函数，给叶子结点添加样式
				}
			}
			this.getBranch(lists)// 调用getBranch函数，传参，对分支节点进行划分
			this.clearPeople=leafList;
		},
		// 判断勾选的信息，分别保存请求后端的数据和成员
		getBranch(data){
			this.submitBranch=[];//清空
			this.submitLeaf=[];
			for(var i=0;i<data.length;i++){
				var isCheck=this.$refs.tree.getNode(data[i].pid).checked;//判断父节点是否被选中
				if(isCheck===false){//没有选中
					if(data[i].isLeaf===false){
						this.submitBranch.push(data[i].id)
					}else{
						this.submitLeaf.push(data[i].id)
					}
				}
			}
		},
		// 提交所勾选的成员
		submit(){
			console.log(this.submitBranch)
			console.log(this.submitLeaf)
			// promise，先请求，在向后端传成员id
		},
		// 勾选
		clickDeal (currentObj, treeStatus) {
		    var selected = treeStatus.checkedKeys.indexOf(currentObj.id) // -1未选	
		    if (selected === -1) {// 未选中
				this.removeClass()//取消勾选时，调用
			}
				this.getCheckedNodes() //调用该函数，获取结点信息
		},
		// 懒加载
		loadNode(node, resolve){
			// 写死的懒加载
			if (node.level === 0) {
			  return resolve([{ name: '组织架构',id:21,isLeaf: false,pid:''}]);
			}
			if (node.level>this.data.length	) return resolve([]);
			const thisdata1 = this.data.data1;
			const thisdata2 = this.data.data2;
			const thisdata22 = this.data.data22;
			const thisdata3 = this.data.data3;
			const thisdata4 = this.data.data4;
			setTimeout(() => {
				if (node.level === 1) {	  
					const data =thisdata1;
					resolve(data);
				} else if (node.level === 2) {
					if(node.data.did==1){
						const data = node.data.isLeaf ? [] : thisdata2;
						resolve(data);
					}else{
						const data = node.data.isLeaf ? [] : thisdata22; 
						resolve(data);
					}
					
				} else if (node.level === 3) {
				    const data =  node.data.isLeaf ? [] : thisdata3;
					resolve(data);
				} else if (node.level === 4) {
				    const data =  node.data.isLeaf ? [] : thisdata4;
					resolve(data); 
				}
			},500);
			setTimeout(()=>{
				if(node.checked==true){
					this.getCheckedNodes()
				}
			},500)
			//从后端请求的懒加载
			// if (node.level === 0) {
			//   return resolve([{ name: '组织架构',id:0,isLeaf: false }]);
			// }else{
			// 	setTimeout(()=>{
			// 		// 从后端请求数据，然后添加到tree上	
			// 		// this.axios.get(url,{{id:data.node.id}}).then(res=>{resolve(res.data)})
			// 	},500);
			// setTimeout(()=>{
			// 	if(node.checked==true){
			// 		this.getCheckedNodes()
			// 	}
			// },500)
			// }
		}
    },
  };
</script>
<style scoped>
	.tree{
		width:400px;
		height:800px;
		border: 1px solid #409EFF;
		margin:auto;
	}
	.el-tree {
		width: 300px;
		height:auto;
		margin:20px;
		padding: 20px;
	}
	.el-tree--highlight-current /deep/.leafColor{color:#0ff;}/* 高亮显示 */
	/* /deep/.el-tree--highlight-current .el-tree-node.is-current>.el-tree-node__content{color:#f00;} */
</style>