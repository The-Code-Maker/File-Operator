function [] = filerenamer(method,options)
%FILERENAMER 文件批量重命名

%%
switch method
    case 'alltype-keyword'
        filepath = options.filepath;
        filetype = options.filetype;
        keyword = options.keyword;
        %读取文件夹信息
        pathinfo = dir(filepath);
        %当前文件夹名称
        for n = 3:length(pathinfo)
            %获取文件的后缀
            if pathinfo(n).isdir
                %跳过文件夹
                continue
            else
                pos = regexp(pathinfo(n).name,'\.');
                if isempty(pos)
                    %跳过无后缀文件
                    continue
                else
                    %获取后缀
                    suffix = pathinfo(n).name(pos(end)+1:end);
                    if strcmp(suffix,filetype)
                        %指定类型文件
                        pos = regexp(pathinfo(n).name,keyword);
                        if ~isempty(pos)
                            newname = [pathinfo(n).name(1:pos(1)-1),...
                                pathinfo(n).name(pos(1)+length(keyword):end)];
                            movefile([filepath,'\',pathinfo(n).name],[filepath,'\',newname]);
                        end
                    else
                        %非指定类型文件
                        continue
                    end
                end
            end
            
        end
        
        
        
end
end