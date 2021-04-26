script "community.livecode.paulmcclernan.xygrid.__DefaultScript"
on gridMouseDown gridX,gridY
   put "START " & gridX,gridY
   set the StartingLinePoint of me to gridX&","& gridY
end gridMouseDown

on gridMouseMove gridX,gridY
   put cr & "MOVE TO " & gridX,gridY after msg
end gridMouseMove

on gridMouseUp gridX,gridY
   put cr& "END " & gridX,gridY after msg
   if the GridEditMode of me is "Draw" then
      if item 2 of the StartingLinePoint of me = gridY then -- constrain to only draw horizontal lines
         set the gridLines of me to the StartingLinePoint of me &":"& gridX &","& gridY 
         put the gridLines of me into tLinesList
         sort lines of tLinesList ascending numeric by item 1 of each 
         put tMode & cr & tLinesList
      end if
   end if
end gridMouseUp

