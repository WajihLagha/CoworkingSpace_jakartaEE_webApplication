/**
 * COWORKING SPACE - MODERN JAVASCRIPT
 * Enhanced interactivity, validation, and user experience
 */

(function () {
  'use strict';

  // ============================================
  // 1. UTILITY FUNCTIONS
  // ============================================

  /**
   * DOM Ready helper
   */
  const ready = (callback) => {
    if (document.readyState !== 'loading') {
      callback();
    } else {
      document.addEventListener('DOMContentLoaded', callback);
    }
  };

  /**
   * Query selector helpers
   */
  const $ = (selector, context = document) => context.querySelector(selector);
  const $$ = (selector, context = document) => Array.from(context.querySelectorAll(selector));

  /**
   * Toggle class helper
   */
  const toggleClass = (element, className) => {
    if (element) element.classList.toggle(className);
  };

  /**
   * Show/hide element with animation
   */
  const show = (element, display = 'block') => {
    if (!element) return;
    element.style.display = display;
    element.classList.add('fade-in');
  };

  const hide = (element) => {
    if (!element) return;
    element.style.display = 'none';
    element.classList.remove('fade-in');
  };

  /**
   * Smooth scroll to element
   */
  const scrollTo = (element, offset = 0) => {
    if (!element) return;
    const elementPosition = element.getBoundingClientRect().top + window.pageYOffset;
    const offsetPosition = elementPosition - offset;

    window.scrollTo({
      top: offsetPosition,
      behavior: 'smooth'
    });
  };

  // ============================================
  // 2. NAVIGATION
  // ============================================

  /**
   * Initialize mobile navigation toggle
   */
  const initMobileNav = () => {
    const toggle = $('.navbar-toggle');
    const mobileMenu = $('.navbar-mobile');

    if (toggle && mobileMenu) {
      toggle.addEventListener('click', () => {
        toggleClass(mobileMenu, 'active');
        const isExpanded = mobileMenu.classList.contains('active');
        toggle.setAttribute('aria-expanded', isExpanded);
      });

      // Close mobile menu when clicking outside
      document.addEventListener('click', (e) => {
        if (!e.target.closest('.navbar') && mobileMenu.classList.contains('active')) {
          mobileMenu.classList.remove('active');
          toggle.setAttribute('aria-expanded', 'false');
        }
      });
    }
  };

  /**
   * Set active navigation link based on current page
   */
  const setActiveNavLink = () => {
    const currentPath = window.location.pathname;
    const navLinks = $$('.navbar-menu a, .navbar-mobile a');

    navLinks.forEach(link => {
      try {
        const linkPath = new URL(link.href).pathname;
        if (currentPath === linkPath || (linkPath !== '/' && currentPath.includes(linkPath))) {
          link.classList.add('active');
        }
      } catch (e) {
        // Ignore invalid URLs
      }
    });
  };

  // ============================================
  // 3. WORKSPACE DESCRIPTION TOGGLE
  // ============================================

  /**
   * Toggle workspace description with smooth animation
   */
  const toggleDescription = (id) => {
    const descElement = document.getElementById(`desc${id}`);
    const button = document.querySelector(`[onclick*="desc${id}"]`);

    if (descElement) {
      const isHidden = descElement.style.display === 'none' || !descElement.style.display;

      if (isHidden) {
        descElement.style.display = 'block';
        descElement.classList.add('slide-down');
        if (button) {
          button.textContent = '↑ Masquer';
          button.setAttribute('aria-expanded', 'true');
        }
      } else {
        descElement.style.display = 'none';
        descElement.classList.remove('slide-down');
        if (button) {
          button.textContent = '↓ Description';
          button.setAttribute('aria-expanded', 'false');
        }
      }
    }
  };

  /**
   * Initialize all description toggles
   */
  const initDescriptionToggles = () => {
    const toggleButtons = $$('[data-toggle="description"]');

    toggleButtons.forEach(button => {
      button.addEventListener('click', (e) => {
        e.preventDefault();
        const targetId = button.getAttribute('data-target');
        const descElement = document.getElementById(targetId);

        if (descElement) {
          const isExpanded = button.getAttribute('aria-expanded') === 'true';

          if (isExpanded) {
            descElement.style.display = 'none';
            button.setAttribute('aria-expanded', 'false');
            button.innerHTML = '↓ Description';
          } else {
            descElement.style.display = 'block';
            descElement.classList.add('slide-down');
            button.setAttribute('aria-expanded', 'true');
            button.innerHTML = '↑ Masquer';
          }
        }
      });
    });
  };

  // ============================================
  // 4. FORM VALIDATION
  // ============================================

  /**
   * Validate email format
   */
  const isValidEmail = (email) => {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
  };

  /**
   * Validate required field
   */
  const isRequired = (value) => {
    return value !== null && value !== undefined && value.trim() !== '';
  };

  /**
   * Show error message for form field
   */
  const showError = (input, message) => {
    const formGroup = input.closest('.form-group');
    if (!formGroup) return;

    // Add error class to input
    input.classList.add('error');
    input.classList.remove('success');

    // Remove existing error message
    const existingError = formGroup.querySelector('.form-error');
    if (existingError) {
      existingError.remove();
    }

    // Add new error message
    const errorElement = document.createElement('span');
    errorElement.className = 'form-error';
    errorElement.textContent = message;
    formGroup.appendChild(errorElement);
  };

  /**
   * Show success state for form field
   */
  const showSuccess = (input) => {
    const formGroup = input.closest('.form-group');
    if (!formGroup) return;

    // Add success class to input
    input.classList.remove('error');
    input.classList.add('success');

    // Remove error message
    const existingError = formGroup.querySelector('.form-error');
    if (existingError) {
      existingError.remove();
    }
  };

  /**
   * Validate single form field
   */
  const validateField = (input) => {
    const value = input.value.trim();
    const type = input.type;
    const required = input.hasAttribute('required');

    // Check if required field is empty
    if (required && !isRequired(value)) {
      showError(input, 'Ce champ est obligatoire');
      return false;
    }

    // Validate email
    if (type === 'email' && value && !isValidEmail(value)) {
      showError(input, 'Veuillez entrer une adresse email valide');
      return false;
    }

    // Validate password length
    if (type === 'password' && value && value.length < 6) {
      showError(input, 'Le mot de passe doit contenir au moins 6 caractères');
      return false;
    }

    // Validate number
    if (type === 'number' && value) {
      const min = input.getAttribute('min');
      const max = input.getAttribute('max');
      const numValue = parseFloat(value);

      if (min && numValue < parseFloat(min)) {
        showError(input, `La valeur doit être au moins ${min}`);
        return false;
      }

      if (max && numValue > parseFloat(max)) {
        showError(input, `La valeur ne doit pas dépasser ${max}`);
        return false;
      }
    }

    // All validations passed
    if (value) {
      showSuccess(input);
    }
    return true;
  };

  /**
   * Initialize form validation
   */
  const initFormValidation = () => {
    const forms = $$('form[data-validate="true"]');

    forms.forEach(form => {
      const inputs = $$('input, select, textarea', form);

      // Validate on blur
      inputs.forEach(input => {
        input.addEventListener('blur', () => {
          validateField(input);
        });

        // Clear error on input
        input.addEventListener('input', () => {
          if (input.classList.contains('error')) {
            input.classList.remove('error');
            const formGroup = input.closest('.form-group');
            const errorElement = formGroup?.querySelector('.form-error');
            if (errorElement) {
              errorElement.remove();
            }
          }
        });
      });

      // Validate on submit
      form.addEventListener('submit', (e) => {
        let isValid = true;

        inputs.forEach(input => {
          if (!validateField(input)) {
            isValid = false;
          }
        });

        if (!isValid) {
          e.preventDefault();

          // Focus first error field
          const firstError = $('input.error, select.error, textarea.error', form);
          if (firstError) {
            firstError.focus();
            scrollTo(firstError, 100);
          }

          // Show alert
          showNotification('Veuillez corriger les erreurs dans le formulaire', 'error');
        }
      });
    });
  };

  // ============================================
  // 5. PRICE CALCULATOR
  // ============================================

  /**
   * Calculate reservation price with supplements
   */
  const calculatePrice = () => {
    const priceElement = $('#total-price');
    if (!priceElement) return;

    const basePrice = parseFloat(priceElement.getAttribute('data-base-price') || 0);
    const isStudent = priceElement.getAttribute('data-student') === 'true';
    const supplementCheckboxes = $$('input[name="supplementIds"]:checked');

    let total = basePrice;

    // Apply student discount
    if (isStudent) {
      total = total * 0.8;
    }

    // Add supplements
    supplementCheckboxes.forEach(checkbox => {
      const supplementPrice = parseFloat(checkbox.getAttribute('data-price') || 0);
      total += supplementPrice;
    });

    // Update display
    priceElement.textContent = `${total.toFixed(2)} €`;
  };

  /**
   * Initialize price calculator
   */
  const initPriceCalculator = () => {
    const supplementCheckboxes = $$('input[name="supplementIds"]');
    if (supplementCheckboxes.length === 0) return;

    supplementCheckboxes.forEach(checkbox => {
      checkbox.addEventListener('change', calculatePrice);
    });

    // Initial calculation
    calculatePrice();
  };

  // ============================================
  // 6. NOTIFICATIONS
  // ============================================

  /**
   * Show toast notification
   */
  const showNotification = (message, type = 'info', duration = 3000) => {
    // Create notification container if it doesn't exist
    let container = $('#notification-container');
    if (!container) {
      container = document.createElement('div');
      container.id = 'notification-container';
      container.style.cssText = `
                position: fixed;
                top: 20px;
                right: 20px;
                z-index: 9999;
                display: flex;
                flex-direction: column;
                gap: 10px;
            `;
      document.body.appendChild(container);
    }

    // Create notification element
    const notification = document.createElement('div');
    notification.className = `alert alert-${type} fade-in`;
    notification.style.cssText = `
            min-width: 300px;
            max-width: 500px;
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
        `;
    notification.textContent = message;

    // Add to container
    container.appendChild(notification);

    // Auto remove after duration
    setTimeout(() => {
      notification.style.opacity = '0';
      notification.style.transform = 'translateX(100%)';
      notification.style.transition = 'all 0.3s';

      setTimeout(() => {
        notification.remove();
      }, 300);
    }, duration);
  };

  /**
   * Show confirmation dialog
   */
  const showConfirmDialog = (message, onConfirm, onCancel) => {
    const confirmed = confirm(message);
    if (confirmed && onConfirm) {
      onConfirm();
    } else if (!confirmed && onCancel) {
      onCancel();
    }
    return confirmed;
  };

  // ============================================
  // 7. TABLE ENHANCEMENTS
  // ============================================

  /**
   * Make table sortable
   */
  const initSortableTable = () => {
    const tables = $$('.data-table[data-sortable="true"]');

    tables.forEach(table => {
      const headers = $$('th', table);

      headers.forEach((header, index) => {
        header.style.cursor = 'pointer';
        header.addEventListener('click', () => {
          sortTable(table, index);
        });
      });
    });
  };

  /**
   * Sort table by column
   */
  const sortTable = (table, columnIndex) => {
    const tbody = $('tbody', table);
    const rows = Array.from(tbody.querySelectorAll('tr'));

    const sortedRows = rows.sort((a, b) => {
      const aValue = a.cells[columnIndex].textContent.trim();
      const bValue = b.cells[columnIndex].textContent.trim();

      // Try to parse as number
      const aNum = parseFloat(aValue);
      const bNum = parseFloat(bValue);

      if (!isNaN(aNum) && !isNaN(bNum)) {
        return aNum - bNum;
      }

      // String comparison
      return aValue.localeCompare(bValue);
    });

    // Clear tbody
    tbody.innerHTML = '';

    // Append sorted rows
    sortedRows.forEach(row => tbody.appendChild(row));
  };

  /**
   * Initialize delete confirmation for table actions
   */
  const initDeleteConfirmation = () => {
    const deleteForms = $$('form[data-confirm="true"]');

    deleteForms.forEach(form => {
      form.addEventListener('submit', (e) => {
        const message = form.getAttribute('data-confirm-message') ||
          'Êtes-vous sûr de vouloir supprimer cet élément ?';

        if (!showConfirmDialog(message)) {
          e.preventDefault();
        }
      });
    });
  };

  // ============================================
  // 8. IMAGE LAZY LOADING
  // ============================================

  /**
   * Initialize lazy loading for images
   */
  const initLazyLoading = () => {
    const images = $$('img[data-src]');

    if ('IntersectionObserver' in window) {
      const imageObserver = new IntersectionObserver((entries, observer) => {
        entries.forEach(entry => {
          if (entry.isIntersecting) {
            const img = entry.target;
            img.src = img.getAttribute('data-src');
            img.removeAttribute('data-src');
            img.classList.add('fade-in');
            observer.unobserve(img);
          }
        });
      });

      images.forEach(img => imageObserver.observe(img));
    } else {
      // Fallback for browsers without IntersectionObserver
      images.forEach(img => {
        img.src = img.getAttribute('data-src');
        img.removeAttribute('data-src');
      });
    }
  };

  // ============================================
  // 9. AUTO-SAVE FORM DATA
  // ============================================

  /**
   * Auto-save form data to localStorage
   */
  const initAutoSave = () => {
    const forms = $$('form[data-autosave="true"]');

    forms.forEach(form => {
      const formId = form.id || form.getAttribute('data-autosave-key');
      if (!formId) return;

      const storageKey = `form_${formId}`;

      // Load saved data
      const savedData = localStorage.getItem(storageKey);
      if (savedData) {
        try {
          const data = JSON.parse(savedData);
          Object.keys(data).forEach(name => {
            const input = form.querySelector(`[name="${name}"]`);
            if (input && input.type !== 'password') {
              input.value = data[name];
            }
          });
        } catch (e) {
          console.error('Error loading saved form data:', e);
        }
      }

      // Save on input
      const inputs = $$('input, select, textarea', form);
      inputs.forEach(input => {
        input.addEventListener('input', () => {
          const formData = {};
          inputs.forEach(inp => {
            if (inp.name && inp.type !== 'password') {
              formData[inp.name] = inp.value;
            }
          });
          localStorage.setItem(storageKey, JSON.stringify(formData));
        });
      });

      // Clear on successful submit
      form.addEventListener('submit', () => {
        localStorage.removeItem(storageKey);
      });
    });
  };

  // ============================================
  // 10. INITIALIZATION
  // ============================================

  /**
   * Initialize all features when DOM is ready
   */
  ready(() => {
    // Navigation
    initMobileNav();
    setActiveNavLink();

    // Forms
    initFormValidation();
    initPriceCalculator();
    initAutoSave();

    // Workspace features
    initDescriptionToggles();

    // Table enhancements
    initSortableTable();
    initDeleteConfirmation();

    // Performance
    initLazyLoading();

    // Show success message if present in URL
    const urlParams = new URLSearchParams(window.location.search);
    const successMessage = urlParams.get('success');
    if (successMessage) {
      showNotification(decodeURIComponent(successMessage), 'success');
    }

    const errorMessage = urlParams.get('error');
    if (errorMessage) {
      showNotification(decodeURIComponent(errorMessage), 'error');
    }
  });

  // ============================================
  // 11. EXPORT FUNCTIONS FOR GLOBAL ACCESS
  // ============================================

  // Make functions available globally for inline event handlers
  window.toggleDesc = toggleDescription;
  window.toggleDescription = toggleDescription;
  window.showNotification = showNotification;
  window.showConfirmDialog = showConfirmDialog;
  window.calculatePrice = calculatePrice;

})();
