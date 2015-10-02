function genSHELL(R,H)
cd mfiles
if exist('R') == 1
    importDataFile(R,H);
else
    importDataFile();
end

errorNumber=checkImport();

if errorNumber()~=0
    error('ERROR FOUND IN INPUTS!');
end

clearOldFiles();

createINTRO();              %needs editing

createUNITS();              %done

createMODEL();              %does not need to be in model

createDIRECTIONS();         %done

createCOORDINATES();        %almost done

createMATERI2();             %only need to make parameters variable

createGEOMET();             %dont need to be changed

createDATA();               %dont need to be changed

createELEMENTS();           %75% done needs to connect elements

createLOAD();               %not started

% createGROUP();              %not started

createSUPPOR();             %not started


disp(sprintf('''END'''));
diary off
cd ..

end
