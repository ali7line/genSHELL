function simulateRnage(r_range,h_range)
    tic
    clear
    clc

    PWD=pwd;
    RESULT='results';
    if exist(RESULT) == 7
        new_backup_dir=int2str(floor(rand(1)*10000));
        new_backup_dir=strcat(RESULT,new_backup_dir);
        movefile(RESULT,new_backup_dir);
        rmdir(RESULT,'s');
        mkdir(sprintf('%s',RESULT));
    else
        mkdir(sprintf('%s',RESULT));
    end
    R_RANGE=r_range*12;
    H_RANGE=h_range*12;
    RH_SIZE=size(R_RANGE,2)*size(H_RANGE,2);
    OUTPUT_GENSHELL=strcat(PWD,'\Output\main.dat');

    I=1;

    for R=R_RANGE
        for H=H_RANGE
            I=I+1;
            FOLDER=sprintf('%s\\H%iR%i',RESULT,H,R);
            mkdir(FOLDER);
            copyfile('command.dcf',FOLDER)
            copyfile('dialogin.bat',FOLDER)
            genSHELL(R,H)
            copyfile(OUTPUT_GENSHELL,FOLDER)
            cd(FOLDER)
            [status, result]=system('C:\Windows\system32\cmd.exe /K "dialogin.bat"');
            delete('diana.ff')
            disp(sprintf('%3.1f',I/RH_SIZE*100))
            cd ../..
            %                 myfile=['file:///'
            %fullfile(x,'myFile.txt')];system('C:\Windows\system32\cmd.exe /K "dialogin.bat"');
        end
    end

    makeReport

    toc
end
