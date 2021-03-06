function fixedThreshold(img1,img2,des1,des2,kp1,kp2)
    % set a threshold (maximum distance) and to return all matches from other images within this threshold.
    matches = [];
    threshold = 59.5;
   
    % Compute the distance between kps of both images
    for i = 1:size(des1,2)
        for j = 1:size(des2,2)
            distance = sqrt(sum((des1(:,i)-des2(:,j)).^2));
            if distance < threshold
                % if the distance is within the threshold, then match+1
                % Store the index of the kepoints
                matches = [matches;[i,j]];
            end
        end
    end
    
    % Draw lines based on matches
    img3 = cat(2,img1,img2);
    imagesc(img3);hold on;
    for i = 1:size(matches,1)
        x0 = kp1(1,matches(i,1));
        y0 = kp1(2,matches(i,1));
        x1 = size(img1,2) + kp2(1,matches(i,2));
        y1 = kp2(2,matches(i,2));
        line([x0,x1],[y0,y1],'color','yellow','LineWidth',1.5);
    end
end