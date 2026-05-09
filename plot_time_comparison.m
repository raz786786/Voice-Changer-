function plot_time_comparison(x, y, effectName)
% plot_time_comparison - Compare original and processed signals

figure;
subplot(2,1,1);
plot(x);
title('Original Voice');
xlabel('Samples');
ylabel('Amplitude');
grid on;

subplot(2,1,2);
plot(y);
title(['Processed Voice - ' effectName]);
xlabel('Samples');
ylabel('Amplitude');
grid on;

sgtitle(['Time Domain Comparison: ' effectName]);
end
