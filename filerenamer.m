function [] = filerenamer(method,options)
%FILERENAMER �ļ�����������

%%
switch method
    case 'alltype-keyword'
        filepath = options.filepath;
        filetype = options.filetype;
        keyword = options.keyword;
        %��ȡ�ļ�����Ϣ
        pathinfo = dir(filepath);
        %��ǰ�ļ�������
        for n = 3:length(pathinfo)
            %��ȡ�ļ��ĺ�׺
            if pathinfo(n).isdir
                %�����ļ���
                continue
            else
                pos = regexp(pathinfo(n).name,'\.');
                if isempty(pos)
                    %�����޺�׺�ļ�
                    continue
                else
                    %��ȡ��׺
                    suffix = pathinfo(n).name(pos(end)+1:end);
                    if strcmp(suffix,filetype)
                        %ָ�������ļ�
                        pos = regexp(pathinfo(n).name,keyword);
                        if ~isempty(pos)
                            newname = [pathinfo(n).name(1:pos(1)-1),...
                                pathinfo(n).name(pos(1)+length(keyword):end)];
                            movefile([filepath,'\',pathinfo(n).name],[filepath,'\',newname]);
                        end
                    else
                        %��ָ�������ļ�
                        continue
                    end
                end
            end
            
        end
        
        
        
end
end