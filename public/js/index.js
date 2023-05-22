// Modal
document.querySelector('.open-modal').addEventListener('click', function () {
    var modal = new bootstrap.Modal(document.getElementById('signupModal'));
    modal.show();
});