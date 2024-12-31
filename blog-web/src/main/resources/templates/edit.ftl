<!DOCTYPE html>
<html lang="zh">
<#include "/common/header.ftl">

<body>
<#include "/common/nav.ftl">

<main>
        <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css">
    <style>


        .logo {
            font-size: 1.5rem;
            font-weight: bold;
        }

        main {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 1rem;
            grid-template-columns: 1fr;
        }

        .publish-form {
            background: white;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            color: #2c3e50;
            font-weight: bold;
        }

        .required::after {
            content: "*";
            color: #e74c3c;
            margin-left: 4px;
        }

        .form-control {
            width: 100%;
            padding: 0.8rem;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 1rem;
        }

        .thumbnail-container {
            width: 300px;
            height: 200px;
            border: 2px dashed #ddd;
            border-radius: 8px;
            overflow: hidden;
            position: relative;
            cursor: pointer;
            transition: all 0.3s;
        }

        .thumbnail-container:hover {
            border-color: #3498db;
        }

        .thumbnail-preview {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .thumbnail-placeholder {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            text-align: center;
            color: #666;
        }

        .thumbnail-input {
            display: none;
        }

        .btn {
            background: #3498db;
            color: white;
            padding: 0.8rem 2rem;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 1rem;
        }

        .btn:hover {
            background: #2980b9;
        }

        .error-message {
            color: #e74c3c;
            font-size: 0.875rem;
            margin-top: 0.25rem;
            display: none;
        }

        footer {
            background-color: #2c3e50;
            color: white;
            text-align: center;
            padding: 1rem;
            margin-top: 2rem;
        }

        #editor {
            margin-bottom: 1.5rem;
            min-height: 350px;
        }

        .select2-container {
            width: 100% !important;
        }


        /* 新增标签选择器样式 */
        .tags-container {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-top: 10px;
        }

        .tag-item {
            padding: 6px 12px;
            background-color: #f5f5f5;
            border: 1px solid #ddd;
            border-radius: 20px;
            cursor: pointer;
            transition: all 0.3s ease;
            user-select: none;
        }

        .tag-item:hover {
            background-color: #e8e8e8;
        }

        .tag-item.selected {
            background-color: #3498db;
            color: white;
            border-color: #3498db;
        }

        .tag-item.disabled {
            opacity: 0.5;
            cursor: not-allowed;
        }

        .tags-limit-hint {
            font-size: 0.875rem;
            color: #666;
            margin-top: 8px;
        }

        .tags-limit-hint.error {
            color: #e74c3c;
        }
    </style>

        <form class="publish-form" id="articleForm" novalidate>
            <div class="form-group">
                <label for="title" class="required">文章标题</label>
                <input type="text" id="title" name="title" class="form-control" placeholder="请输入文章标题">
                <div class="error-message" id="titleError">请输入文章标题</div>
            </div>


            <div class="form-group">
                <label for="editor" class="required">文章内容</label>
                <div id="editor"></div>
                <div class="error-message" id="contentError">请输入文章内容</div>
            </div>

            <div class="form-group">
                <label for="thumbnail" class="required">文章缩略图</label>
                <div class="thumbnail-container" id="thumbnailContainer">
                    <img id="thumbnailPreview" class="thumbnail-preview" src="/img/upload.png" alt="缩略图预览">
                    <div class="thumbnail-placeholder">
                        <p>点击上传图片</p>
                        <p>或拖拽图片到此处</p>
                    </div>
                    <input type="file" id="thumbnail" name="thumbnail" class="thumbnail-input" accept="image/*">
                </div>
                <div class="error-message" id="thumbnailError">请上传文章缩略图</div>
            </div>

            <div class="form-group">
                <label for="category" class="required">分类</label>
                <select id="category" name="category" class="form-control">
                    <option value="">选择分类</option>
                    <#list categories as c>
                        <option value="${c.id}"  >${c.name}</option>
                    </#list>

<#--                    <option value=1>前端开发</option>-->
<#--                    <option value=2>后端开发</option>-->
<#--                    <option value=3>机器学习</option>-->
<#--                    <option value=4>人工智能</option>-->
                </select>
                <div class="error-message" id="categoryError">请选择文章分类</div>
            </div>



 <!-- 标签选择部分 -->
    <div class="form-group">
        <label for="tags" class="required">标签</label>
        <div class="tags-container" id="tagsContainer">
            <#list tags as tag>
                <div class="tag-item" data-tag="frontend">${tag.name}</div>

            </#list>
<#--            <div class="tag-item" data-tag="backend">后端开发</div>-->
<#--            <div class="tag-item" data-tag="database">数据库</div>-->
<#--            <div class="tag-item" data-tag="cloud">云计算</div>-->
<#--            <div class="tag-item" data-tag="devops">DevOps</div>-->
<#--            <div class="tag-item" data-tag="security">安全</div>-->
<#--            <div class="tag-item" data-tag="architecture">架构设计</div>-->
<#--            <div class="tag-item" data-tag="testing">测试</div>-->
<#--            <div class="tag-item" data-tag="mobile">移动开发</div>-->
<#--            <div class="tag-item" data-tag="ai">人工智能</div>-->
<#--            <div class="tag-item" data-tag="bigdata">大数据</div>-->
<#--            <div class="tag-item" data-tag="blockchain">区块链</div>-->
<#--            <div class="tag-item" data-tag="linux">Linux</div>-->
<#--            <div class="tag-item" data-tag="network">网络</div>-->
<#--            <div class="tag-item" data-tag="tools">开发工具</div>-->
        </div>
        <div class="tags-limit-hint">请选择1-5个标签</div>
        <div class="error-message" id="tagsError">请至少选择一个标签</div>
    </div>

            <button type="submit" class="btn">发布文章</button>
            <button type="submit" class="btn">保存草稿</button>

        </form>
    </main>

<#include "/common/footer.ftl">


<!-- Editor -->
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
<!-- Editor's Plugin -->
<script src="https://uicdn.toast.com/editor-plugin-code-syntax-highlight/latest/toastui-editor-plugin-code-syntax-highlight-all.min.js"></script>

<#--    <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
    <script>

        let editor;
        let selectedTags;
        // 初始化 Select2
        $(document).ready(function() {


            // 初始化 Toast UI Editor
             editor = new toastui.Editor({
                el: document.querySelector('#editor'),
                height: '500px',
                initialEditType: 'markdown',
                previewStyle: 'vertical',
                toolbarItems: [
                    ['heading', 'bold', 'italic', 'strike'],
                    ['hr', 'quote'],
                    ['ul', 'ol', 'task'],
                    ['table', 'link'],
                    ['code', 'codeblock'],
                    ['scrollSync']
                ]
            });



            // $('#tags').select2({
            //     placeholder: '请选择标签',
            //     allowClear: true,
            //     closeOnSelect: false
            // });
        });

        // 图片上传处理
        const thumbnailContainer = document.getElementById('thumbnailContainer');
        const thumbnailInput = document.getElementById('thumbnail');
        const thumbnailPreview = document.getElementById('thumbnailPreview');
        const thumbnailPlaceholder = document.querySelector('.thumbnail-placeholder');

        // 点击容器触发文件选择
        thumbnailContainer.addEventListener('click', () => thumbnailInput.click());

        // 处理拖拽上传
        thumbnailContainer.addEventListener('dragover', (e) => {
            e.preventDefault();
            thumbnailContainer.style.borderColor = '#3498db';
        });

        thumbnailContainer.addEventListener('dragleave', () => {
            thumbnailContainer.style.borderColor = '#ddd';
        });

        thumbnailContainer.addEventListener('drop', (e) => {
            e.preventDefault();
            thumbnailContainer.style.borderColor = '#ddd';
            const file = e.dataTransfer.files[0];
            if (file && file.type.startsWith('image/')) {
                handleImageFile(file);
            }
        });

        // 处理文件选择
        thumbnailInput.addEventListener('change', (e) => {
            const file = e.target.files[0];
            if (file) {
                handleImageFile(file);
            }
        });

        function handleImageFile(file) {
            const reader = new FileReader();
            reader.onload = function(e) {
                thumbnailPreview.src = e.target.result;
                thumbnailPlaceholder.style.display = 'none';
                document.getElementById('thumbnailError').style.display = 'none';
            }
            reader.readAsDataURL(file);
        }

        function initTagSelect(){
            console.log('initTagSelect');
            selectedTags = new Set();
            const tagsContainer = document.getElementById('tagsContainer');
            const tagsError = document.getElementById('tagsError');
            const tagsLimitHint = document.querySelector('.tags-limit-hint');
            const maxTags = 5;


            tagsContainer.addEventListener('click', (e) => {
                const tagItem = e.target.closest('.tag-item');
                if (!tagItem) return;

                const tagValue = tagItem.dataset.tag;

                if (tagItem.classList.contains('selected')) {
                    tagItem.classList.remove('selected');
                    selectedTags.delete(tagValue);
                } else {
                    if (selectedTags.size >= maxTags) {
                        tagsLimitHint.textContent = `最多只能选择5个标签`;
                        tagsLimitHint.classList.add('error');
                        setTimeout(() => {
                            tagsLimitHint.textContent = '请选择1-5个标签';
                            tagsLimitHint.classList.remove('error');
                        }, 2000);
                        return;
                    }
                    tagItem.classList.add('selected');
                    selectedTags.add(tagValue);
                }

                // 更新剩余标签的状态
                updateTagsState(tagsContainer,selectedTags);
                // 隐藏错误提示
                if (selectedTags.size > 0) {
                    tagsError.style.display = 'none';
                }
            });
        }

        initTagSelect();


        function updateTagsState(tagsContainer,selectedTags) {

            const maxTags = 5;

            const tagItems = tagsContainer.querySelectorAll('.tag-item');
            tagItems.forEach(item => {
                if (!item.classList.contains('selected') && selectedTags.size >= maxTags) {
                    item.classList.add('disabled');
                } else {
                    item.classList.remove('disabled');
                }
            });
        }


        // 表单验证
        document.getElementById('articleForm').addEventListener('submit', async function(e) {
            e.preventDefault();

            console.log('表单验证');
            
            let isValid = true;
            
            // 验证标题
            const title = document.getElementById('title').value.trim();
            if (!title) {
                document.getElementById('titleError').style.display = 'block';
                isValid = false;
            } else {
                document.getElementById('titleError').style.display = 'none';
            }

            // 验证缩略图
            if (!thumbnailInput.files[0] && thumbnailPreview.src.includes('/api/placeholder/')) {
                document.getElementById('thumbnailError').style.display = 'block';
                isValid = false;
            }

            // 验证分类
            const category = document.getElementById('category').value;
            if (!category) {
                document.getElementById('categoryError').style.display = 'block';
                isValid = false;
            } else {
                document.getElementById('categoryError').style.display = 'none';
            }

            // 验证内容
            const content = editor.getMarkdown().trim();
            if (!content) {
                document.getElementById('contentError').style.display = 'block';
                isValid = false;
            } else {
                document.getElementById('contentError').style.display = 'none';
            }




            // 验证标签
            const tagsError = document.getElementById('tagsError');
            if (selectedTags.size === 0) {
                tagsError.style.display = 'block';
                isValid = false;
            } else {
                tagsError.style.display = 'none';
            }

            if (!isValid) {
                return;
            }

            // 提交表单
            const formData = new FormData();
            formData.append('title', title);
            formData.append('category', category);
            formData.append('content', content);
            formData.append('tags', JSON.stringify(Array.from(selectedTags)));
            if (thumbnailInput.files[0]) {
                formData.append('thumbnail', thumbnailInput.files[0]);
            }

            try {
                let token = localStorage.getItem('x-token');
                const response = await fetch('/admin/save', {
                    method: 'POST',
                    headers: {
                        Authorization: `Bearer `+token,
                    },
                    body: formData
                });

                console.log('Response:', response);
                if (response.ok) {
                    alert('文章发布成功！');
                   // window.location.href = '/';
                } else {
                    alert('发布失败，请重试');
                }
            } catch (error) {
                console.error('Error:', error);
                alert('发布失败，请重试');
            }
        });
        
    </script>
</body>
</html>
